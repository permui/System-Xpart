ENTRY(_start)

SECTIONS
{
    . = 0x0;
    _start = .;
    .text.init : { 
        *(.text.init) 
    }
    .text : { 
        *(.text) 
        *(.note.gnu.build-id)
    }
    .data : { 
        *(.data) 
    }
}
