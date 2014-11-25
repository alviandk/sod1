Uses crt;
Const
     Garis='-----------------------------------------------------------------------------';
Type
    Data = Record
          NPM       : string[8];
          Nama      : string[25];
          Tgl_Lhr   : string[15];
          Kls       : integer;
End;
Var
   File_Data       : File Of Data;
   Data_Mhs        : Data;
   i,jumlah_data   : integer;
   Lagi            : char;
Begin
     clrscr;
     Assign(File_Data,'D:\Ujian.Dat');
     Reset(File_Data);
     Jumlah_Data:=FileSize(File_Data);
     clrscr;
     textcolor(10);
     writeln(' ':25,'\     DAFTAR MAHASISWA     /');
     writeln(' ':26,'--------------------------');
     writeln;
     textcolor(13);
     writeln(Garis);
     textcolor(9);
     write('| No |    NPM    |            NAMA           |');
     writeln('  Tanggal Lahir  |   Kelas   |');
     textcolor(13);
     writeln(Garis);
     For i:=1 To Jumlah_Data Do
     Begin
          Read(File_Data,Data_Mhs);
          textcolor(11);
          gotoxy(1,wherey);write('| ',i:2,' |');
          with Data_Mhs Do
          Begin
               gotoxy(8,wherey);write(NPM);
               gotoxy(18,wherey);write('|  ',Nama);
               gotoxy(46,wherey);write('|  ',Tgl_Lhr);
               gotoxy(64,wherey);write('| ',Kls);
               gotoxy(77,wherey);write('|');
          End;
          writeln;
     End;
     textcolor(13);
     writeln(Garis);
     Close(File_Data);
     readln;
End.