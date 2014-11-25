Uses crt;
Type
    Data = Record
          NPM       : string[8];
          Nama      : string[25];
          Tgl_Lhr   : string[15];
          No_Rmh    : integer;
End;
Var
   File_Data       : File Of Data;
   Data_Mhs        : Data;
   i               : integer;
   Lagi            : char;
Begin
     Assign(File_Data,'D:\Mhs.Dat');
     Rewrite(File_Data);
     i:=0;
     Repeat
           Inc(i);
           clrscr;
           textcolor(14);
           gotoxy(25,5);writeln('Menginput Data ke-',i);
           textcolor(9);
           gotoxy(24,6);writeln('=====================');
           writeln;
           with Data_Mhs Do
           Begin
                textcolor(13);
                gotoxy(15,8);write('NPM Mahasiswa             : ');readln(NPM);
                gotoxy(15,9);write('Nama Mahasiswa            : ');readln(Nama);
                gotoxy(15,10);write('Tanggal Lahir(dd-mm-yyyy) : ');readln(Tgl_Lhr);
                gotoxy(15,11);write('No Rumah                  : ');readln(No_Rmh);
           End;
           write(File_Data,Data_Mhs);
           writeln;
           write(' ':15,'Apakah Anda Ingin Mengisi Lagi [Y/T] : ');readln(Lagi);
     Until Not (Lagi In ['Y','y']);
          writeln(' ');
          writeln(' ');
          textcolor(12);
          writeln('Tekan Enter Untuk Keluar!!');
          readln;
          Close(File_Data);
End.