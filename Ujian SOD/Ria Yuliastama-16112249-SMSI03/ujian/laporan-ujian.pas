Uses crt;
Const
     Garis='----------------------------------------------------------------------------';
Type
    Data = Record
          NPM     : string[8];
          Nama    : string[25];
          Kls     : string[5];
	  Tgl_Lhr : string[20];
End;
Var
   File_Data       : File Of Data;
   Data_Mhs, Temp  : Data;
   a,i,j,k,l,r,s   : integer;
   urut            : array [1..20] of Data;
Begin
     Assign(File_Data,'E:\sarmag\Ujian.Dat');
     Reset(File_Data);
     For r:=1 To 20 Do
     Read(File_Data,urut[r]);
     Close(File_Data);
     For r:=1 To 19 Do
     For s:=r To 20 Do
     If urut[s].NPM<urut[r].NPM Then
        Begin
	     Temp:=urut[r];
	     urut[r]:=urut[s];
	     urut[s]:=Temp;
	End;
        Assign(File_Data,'E:\sarmag\Ujian.dat');
	Rewrite(File_Data);
	For a:=1 to 20 do
	    write(File_Data,urut[a]);
	    Close(File_Data);
	    clrscr;
     Assign(File_Data,'E:\sarmag\Ujian.dat');
     Reset(File_Data);
     writeln(' ':30,'Daftar Mahasiswa');
     writeln(' ':70,'Hal 1');
     textcolor(9);
     writeln(Garis);
     textcolor(11);
     writeln('| No |    NPM    |            NAMA           |     Tgl. Lahir    |  Kelas  |');
     textcolor(9);
     writeln(Garis);
     For i:=1 To 7 Do
     Begin
          Read(File_Data,Data_Mhs);
          with Data_Mhs Do
          Begin
               textcolor(5);
               write('|',i:3,' |',NPM:9,'  | ',Nama:25,' | ',Tgl_Lhr:15,'   |',Kls:6,'   |');
          End;
          writeln;
     End;
     textcolor(9);
     writeln(Garis);
     writeln;
     textcolor(12);
     writeln(' ':70,'Hal 2');
     textcolor(9);
     writeln(Garis);
     textcolor(11);
     writeln('| No |    NPM    |            NAMA           |     Tgl. Lahir    |  Kelas  |');
     textcolor(9);
     writeln(Garis);
     For j:=1 to 3 Do
     Begin
          Read(File_Data,Data_Mhs);
          with Data_Mhs Do
          Begin
          textcolor(5);
          write('|',j:3,' |',NPM:9,'  | ',Nama:25,' | ',Tgl_Lhr:15,'   |',Kls:6,'   |');
          End;
          writeln;
     End;
     textcolor(9);
     writeln(Garis);
     writeln;
     textcolor(12);
     writeln(' ':70,'Hal 3');
     textcolor(9);
     writeln(Garis);
     textcolor(11);
     writeln('| No |    NPM    |            NAMA           |     Tgl. Lahir    |  Kelas  |');
     textcolor(9);
     writeln(Garis);
     For k:=1 to 2 Do
     Begin
          Read(File_Data,Data_Mhs);
          with Data_Mhs Do
          Begin
          textcolor(5);
          write('|',k:3,' |',NPM:9,'  | ',Nama:25,' | ',Tgl_Lhr:15,'   |',Kls:6,'   |');
          End;
          writeln;
     End;
     textcolor(9);
     writeln(Garis);
     textcolor(12);
     writeln(' ':70,'Hal 4');
     textcolor(9);
     writeln(Garis);
     textcolor(11);
     writeln('| No |    NPM    |            NAMA           |     Tgl. Lahir    |  Kelas  |');
     textcolor(9);
     writeln(Garis);
     For a:=1 to 8 Do
     Begin
          Read(File_Data,Data_Mhs);
          with Data_Mhs Do
          Begin
          textcolor(5);
          write('|',a:3,' |',NPM:9,'  | ',Nama:25,' | ',Tgl_Lhr:15,'   |',Kls:6,'   |');
          End;
          writeln;
     End;
     textcolor(9);
     writeln(Garis);
     textcolor(12);
     writeln(' ':70,'Hal 5');
     textcolor(9);
     writeln(Garis);
     textcolor(11);
     writeln('| No |    NPM    |            NAMA           |  Tgl. Lahir  |  Kelas  |');
     a:=0;
     Begin
          with Data_Mhs Do
          Begin
               write('|',a:3,' |',NPM:9,'  | ',Nama:25,' | ',Tgl_Lhr:15,'   |',Kls:6,'   |');
          End;
     End;
     textcolor(9);
     writeln(Garis);
     writeln;
     Close(File_Data);
     readln;
End.