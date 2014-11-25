Uses crt;
Const
Garis='-------------------------------------------------------';
Type
    Data = record
          NPM   : string [8];
          Nama  : string [25];
          Usia  : integer ;
End;
Var
   File_Data              : File Of Data;
   Data_Mhs,Temp          : Data;
   a,b,r,s,jum1,jum2,gtot  : integer;
   urut                   : array [1..10] of Data;
Begin
     Assign(File_Data,'D:\Mhs2.dat');
     Reset(File_Data);
     For r:=1 To 10 Do
     Read(File_Data,urut[r]);
     Close(File_Data);
     For r:=1 To 9 Do
     For s:=r To 10 Do
     If urut[s].NPM<urut[r].NPM Then
        Begin
	     Temp:=urut[r];
	     urut[r]:=urut[s];
	     urut[s]:=Temp;
	End;
	Assign(File_Data,'D:\Mhs2.dat');
	Rewrite(File_Data);
	For a:=1 to 10 do
	    write(File_Data,urut[a]);
	    Close(File_Data);
	    clrscr;
        jum1:=0;
        jum2:=0;
        gtot:=0;
        Assign(File_Data,'D:\Mhs2.dat');
        Reset(File_Data);
        writeln(' ':30,'Daftar Mahasiswa');
        writeln(' ':35,'Hal 1');
        textcolor(9);
        writeln(Garis);
        textcolor(11);
        writeln('| No |    NPM    |           Nama            |  Usia  |');
        textcolor(9);
        writeln(Garis);
        For b:= 1 to 5 Do
            Begin
                 textcolor(5);
                 Read(File_Data,Data_Mhs);
                 with Data_Mhs do
                 Begin
                      write('|',b:3,' |',NPM:9,'  | ',Nama:25,' |  ',Usia:3,'   |');
                      jum1:=jum1+Usia;
                 End;
                 writeln;
            End;
            textcolor(9);
            writeln(Garis);
            textcolor(14);
            write('Jumlah :');
            writeln(' ':37,'|   ',jum1,'   |');
            textcolor(9);
            writeln(Garis);
            writeln;
            textcolor(12);
            writeln(' ':50,'Hal 2');
            textcolor(9);
            writeln(Garis);
            textcolor(11);
            writeln('| No |    NPM    |           Nama            |  Usia  |');
            textcolor(9);
            writeln(Garis);
            For a:= 6 to 10 do
            Begin
                 Read(File_Data,Data_Mhs);
                 with Data_Mhs do
                 Begin
                      textcolor(5);
                      write('|',a:3,' |',NPM:9,'  | ',Nama:25,' |  ',Usia:3,'   |');
                      jum2:=(jum2+Usia);
                 End;
                 writeln;
            End;
            textcolor(9);
            writeln(Garis);
            textcolor(14);
            write('Jumlah :');
            writeln(' ':37,'|   ',jum2,'   |');
            textcolor(9);
            writeln(Garis);
            writeln;
            gtot:=jum1+jum2;
            textcolor(12);
            write('Grand Total :');write(gtot);
            Close(File_Data);
            readln;
End.