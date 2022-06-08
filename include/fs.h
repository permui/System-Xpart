#pragma once

#include "stddef.h"

struct cpio_newc_header {
        char    c_magic[6];     // "070701"
        char    c_ino[8];       // File inode number
        char    c_mode[8];      // File mode and permissions
        char    c_uid[8];       // File uid
        char    c_gid[8];       // File gid
        char    c_nlink[8];     // Number of links
        char    c_mtime[8];     // Modification time
        char    c_filesize[8];  // Size of data field
        char    c_devmajor[8];  // Major part of file device number
        char    c_devminor[8];  // Minor part of file device number
        char    c_rdevmajor[8]; // Major part of device node reference
        char    c_rdevminor[8]; // Minor part of device node reference
        char    c_namesize[8];  // Length of filename, including final \0
        char    c_check[8];     // Checksum of data field for CRC mode
        char    c_name[0];
};

struct cpio_stat {
        size_t  c_ino;       // File inode number
        size_t  c_mode;      // File mode and permissions
        size_t  c_uid;       // File uid
        size_t  c_gid;       // File gid
        size_t  c_nlink;     // Number of links
        size_t  c_mtime;     // Modification time
        size_t  c_filesize;  // Size of data field
        size_t  c_devmajor;  // Major part of file device number
        size_t  c_devminor;  // Minor part of file device number
        size_t  c_rdevmajor; // Major part of device node reference
        size_t  c_rdevminor; // Minor part of device node reference
        uintptr_t* data;
};


struct stat {
        size_t  st_dev;         /* ID of device containing file */
        size_t  st_ino;         /* Inode number */
        size_t  st_mode;        /* File type and mode */
        size_t  st_nlink;       /* Number of hard links */
        size_t  st_uid;         /* User ID of owner */
        size_t  st_gid;         /* Group ID of owner */
        size_t  st_rdev;        /* Device ID (if special file) */
        size_t  st_size;        /* Total size, in bytes */
        size_t  st_blksize;     /* Block size for filesystem I/O */
        size_t  st_blocks;      /* Number of 512B blocks allocated */
};



typedef struct disk_operations {
        // need to fill
} disk_operations_t;


void fs_test();


struct inode {
        const struct inode_operations *i_op;
        void *i_private;
};

#define O_ACCMODE	00000003
#define O_RDONLY	00000000
#define O_WRONLY	00000001
#define O_RDWR		00000002
#define O_CREAT		00000100
#define O_EXCL		00000200
#define O_NOCTTY	00000400
#define O_TRUNC		00001000
#define O_APPEND	00002000
#define O_NONBLOCK	00004000
#define O_DSYNC		00010000
#define FASYNC		00020000
#define O_DIRECT	00040000
#define O_LARGEFILE	00100000
#define O_DIRECTORY	00200000
#define O_NOFOLLOW	00400000
#define O_NOATIME	01000000
#define O_CLOEXEC	02000000

struct file {
        struct inode *node;
        size_t offset;
        size_t flags;
};

int fs_open(const char *pathname, int flags);
int fs_read(int fd, void *buf, size_t count);
int fs_write(int fd, const void *buf, size_t count);

struct inode *namei(const char *path);
int readi(struct inode *ip, int user_dst, void *dst, uint off, uint n);
uint64 get_file_size(struct inode *i);
int existsQ(const char *path);