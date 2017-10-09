#include <proto/exec.h>
#include <proto/dos.h>



int main(int argc, char *argv[]) {
  struct Library *SysBase;
  struct Library *DOSBase;

  SysBase = *((struct Library **)4UL);
  DOSBase = OpenLibrary("dos.library", 0);

  if(DOSBase) {
    Write(Output(), "HELLO WORLD!     \n", 18);
    CloseLibrary(DOSBase);
  }

  return(0);
}

