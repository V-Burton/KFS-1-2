#include <stdint.h>
#include "gdt.h"
#include "idt.h"
#include "../printf/ft_printf.h"

void kernel_main() {
    flush_screen();
    init_gdt();
    setup_idt();
    ft_printf(0x0A, "Commandes disponibles :\n");
    ft_printf(0x07, "  help  - Affiche cette aide\n");
    ft_printf(0x07, "  proc  - Affiche les informations CPU\n");
    ft_printf(0x07, "  addr_gdt - Affiche l'adresse de la GDT\n");
    ft_printf(0x07, "  divide_by_zero - Simule une division par zero\n");
    ft_printf(0x07, "  panic - Simule une panique du kernel (int 0x05)\n");
    ft_printf(0x07, "  stack_dump <n> - Affiche les n premieres ligne de la stack. (max 24)\n");
    ft_printf(0x07, "  clear - Efface l'ecran\n");
    ft_printf(0x0E, "KFS>");
}