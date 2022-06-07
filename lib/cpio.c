#include "fs.h"
#include "mm.h"
#include "slub.h"
#include "string.h"
// #include "stdio.h"
#include "consts.h"

#define ALIGN4(value) (((size_t)value + 3) >> 2 << 2)

#define CPIO_HEADER_SIZE (sizeof(struct cpio_newc_header))

// uintptr_t *initrd_start = 0x4000000UL + DEV_VM_START;
size_t getFieldVal(char *field, int length) {
    size_t value = 0;
    for (int i = 0; i < length; i++) {
        switch (field[i]) {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
                value = (value << 4) | (field[i] - '0');
                break;
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
                value = (value << 4) | (field[i] - 'a' + 10);
                break;
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
                value = (value << 4) | (field[i] - 'A' + 10);
                break;
        }
    }

    return value;
}

int check_file_name(const char *tar, const char *cmp) {
    while (*tar && *tar == *cmp)
        tar++, cmp++;
    return *tar - *cmp;
}

struct cpio_stat cpio_find_file(const char *name) {
    struct cpio_stat stat = {.c_ino = 0};
    struct cpio_newc_header *p = (struct cpio_newc_header *)INITRD_START; 

    if ((name[0] == '.') && (name[1] == '/')) {
        name += 2;
    } else if (name[0] == '/') {
        name += 1;
    }

    while (check_file_name("TRAILER!!!", p->c_name)) {
        // Log("Current is: %s", p->c_name);

        if (!check_file_name(name, p->c_name)) {
            stat.c_ino = getFieldVal(p->c_ino, 8);
            stat.c_mode = getFieldVal(p->c_mode, 8);
            stat.c_uid = getFieldVal(p->c_uid, 8);
            stat.c_gid = getFieldVal(p->c_gid, 8);
            stat.c_nlink = getFieldVal(p->c_nlink, 8);
            stat.c_mtime = getFieldVal(p->c_mtime, 8);
            stat.c_filesize = getFieldVal(p->c_filesize, 8);
            stat.c_devmajor = getFieldVal(p->c_devmajor, 8);
            stat.c_devminor = getFieldVal(p->c_devminor, 8);
            stat.c_rdevmajor = getFieldVal(p->c_rdevmajor, 8);
            stat.c_rdevminor = getFieldVal(p->c_rdevminor, 8);
            stat.data = (void *)p + ALIGN4(CPIO_HEADER_SIZE + getFieldVal(p->c_namesize, 8));

            return stat;
        }

        p = (void *)p + ALIGN4(CPIO_HEADER_SIZE + getFieldVal(p->c_namesize, 8)) + ALIGN4(getFieldVal(p->c_filesize, 8));
    }

    return stat;
}

// 070701
// 002A1C63
// 000081B4
// 000003E8
// 000003E8
// 00000001
// 5FE4A4B8
// 00000018
// 00000008
// 00000011
// 00000000
// 00000000
// 00000005
// 00000000
// flag..
// flag={HappyNewYear2021}.

// void fs_test() {
//     struct cpio_stat stat = cpio_find_file("flag");
//     if (stat.c_ino) {
//         puts("Get File: \n");
//         printf("\tc_ino->%lx\n", stat.c_ino);
//         printf("\tc_mode->%lx\n", stat.c_mode);
//         printf("\tc_uid->%lx\n", stat.c_uid);
//         printf("\tc_gid->%lx\n", stat.c_gid);
//         printf("\tc_nlink->%lx\n", stat.c_nlink);
//         printf("\tc_mtime->%lx\n", stat.c_mtime);
//         printf("\tc_filesize->%lx\n", stat.c_filesize);
//         printf("\tc_devmajor->%lx\n", stat.c_devmajor);
//         printf("\tc_devminor->%lx\n", stat.c_devminor);
//         printf("\tc_rdevmajor->%lx\n", stat.c_rdevmajor);
//         printf("\tc_rdevminor->%lx\n", stat.c_rdevminor);
//         puts("File Content: \n");
//         char *value = stat.data;
//         for (int i = 0; i < stat.c_filesize; i++) {
//             putchar(value[i]);
//         }
//         puts("\n");
//     }
// }

struct inode *namei(const char *path) {
    struct inode *n = kmalloc(sizeof(struct inode));
    struct cpio_stat *stat = kmalloc(sizeof(struct cpio_stat));
    n->i_private = stat;
    *stat = cpio_find_file(path);
    return n;
}

int readi(struct inode *ip, int user_dst, void *dst, uint off, uint n) {
    struct cpio_stat *stat = ip->i_private;
    void *base = stat->data;
    memcpy(dst, base + off, n);
    return n;
}

uint64 get_file_size(struct inode *i) {
    struct cpio_stat *stat = i->i_private;
    return stat->c_filesize;
}