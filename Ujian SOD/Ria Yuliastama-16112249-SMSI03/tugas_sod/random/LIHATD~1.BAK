Uses crt;
    Const
    Garis='------------------------------------------------------------------------------';
Type
    Data = Record
          NPM    : string [8];
          Nama     : string [25];
          Tgl_Lhr : string [15];
          No_Rmh : integer;
    End;
   Var
       File_Data : File Of Data;
       Data_Mhs     : array[1..10] of Data;
       p,jumdat         : integer;
       Lagi     : char;
   Begin
     clrscr;
     Assign (File_Data,'D:\Mhs1.dat');
     Reset(File_Data);
     jumdat:=FileSize(File_Data);
     clrscr;
     textcolor(10);
     writeln(' ':25,'\  DAFTAR MAHASISWA  /');
     writeln(' ':26,'------------------');
     writeln;
     textcolor(13);
     writeln(Garis);
     textcolor(9);
     write('| No |    NPM    |            NAMA            |');
     writeln('  Tanggal Lahir  |  No Rumah  |');
     textcolor(13);
     writeln(Garis);
     For p:= 1 To jumdat Do
     Begin
          Read(File_Data,Data_Mhs[p]);
          textcolor(11);
	  gotoxy(1,wherey);write('| ',p:2,' |');
	  Begin
               gotoxy(8,wherey);write(Data_Mhs[p].NPM);
               gotoxy(18,wherey);write('| ',Data_Mhs[p].Nama);
               gotoxy(46,wherey);write(' | ',Data_Mhs[p].Tgl_Lhr);
               gotoxy(64,wherey);write(' | ',Data_Mhs[p].No_Rmh);
	       gotoxy(77,wherey);write(' |');
          End;
          writeln;
     End;
     textcolor(13);
     writeln(Garis);
     Close(File_Data);
     readln;
End.