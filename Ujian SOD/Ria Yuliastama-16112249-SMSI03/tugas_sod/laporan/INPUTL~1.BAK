Uses crt;
Type
    Data = Record
          NPM   : string[8];
          Nama  : string[25];
          Usia  : integer;
End;
Var
   File_Data       : File Of Data;
   Data_Mhs        : Data;
   i,j             : integer;
Begin
     Assign(File_Data,'D:\Mhs2.Dat');
     Rewrite(File_Data);
     For i:=1 to 10 Do
     Begin
          clrscr;
          textcolor(12);
          writeln('Menginput Data ke- ',i);
          writeln;
          with Data_Mhs do
          Begin
               textcolor(13);
               write('NPM Mahasiswa   : ');readln(NPM);
               write('Nama Mahasiswa  : ');readln(Nama);
               write('Usia            : ');readln(Usia);
          End;
          writeln;
          write(File_Data,Data_Mhs);
     End;
     Close(File_Data);
     readln;
End.