#include <stdint.h>

uint16_t* terminal_buffer = (uint16_t*)0xB8000;

int terminal_write_string(const char* data, int line) {
    for (int i = 0; data[i] != '\0'; i++) {
        terminal_buffer[line * 80 + i] = (uint16_t)data[i] | (uint16_t)0x0F << 8;
    }
    
    return ++line;
}

void kernel_main() {
    int line = 1;

    line = terminal_write_string("Hello", line);
    line = terminal_write_string("Welcome to KFS!", line);
}