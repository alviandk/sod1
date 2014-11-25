Uses crt;
Type
    Data = Record
          NPM       : string[8];
          Nama      : string[25];
          Tgl_Lhr   : string[15];
          Kls       : string[5];
End;
Var
   File_Data       : File Of Data;
   Data_Mhs        : Data;
   i               : integer;
   Lagi            : char;
Begin
     Assign(File_Data,'E:\sarmag\Ujian.Dat');
     Rewrite(File_Data);
     For i:=1 to 20 Do
     Begin
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
                gotoxy(15,11);write('Kelas                     : ');readln(Kls);
           End;
           writeln;
           write(File_Data,Data_Mhs);
     End;
          writeln(' ');
          writeln(' ');
          textcolor(12);
          writeln('Tekan Enter Untuk Keluar!!');
          Close(File_Data);
          readln;
End.