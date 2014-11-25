Uses crt;
Type
    Data = Record
         NPM     : string [8];
         Nama    : string [25];
         Tgl_Lhr : string [15];
         No_Rmh  : integer;
End;
Var
   File_Data : File Of Data;
   Data_Mhs                 : array[1..10] of Data;
   a,b     : integer;
   Lagi     : char;
Begin
     Assign (File_Data,'D:\Mhs1.dat');
     Rewrite(File_Data);
     a:=0;
     Repeat
           Inc(a);
           clrscr;
           textcolor(9);
           gotoxy(25,4);
           writeln('==================');
	   textcolor(14);
           gotoxy(25,5);
	   writeln('Mengisi Data ke- ',a);
           textcolor(9);
	   gotoxy(25,6);
	   writeln('==================');
	   writeln;
           Begin
                textcolor(11);
                write('NPM                       : ');readln(Data_Mhs[a].NPM);
                write('Nama                      : ');readln(Data_Mhs[a].Nama);
                write('Tanggal Lahir(dd/mm/yyyy) : ');read(Data_Mhs[a].Tgl_Lhr);
                write('No Rumah                  : ');readln(Data_Mhs[a].No_Rmh);
           End;
           write(File_Data,Data_Mhs[a]);
           writeln;
	   textcolor(10);
	   writeln(' ');
           write(' ':15,'Apakah Anda Ingin Input Data Lagi [Y/T] : ');readln(Lagi);
     Until Not (Lagi In ['Y','y']);
     writeln(' ');
     writeln(' ');
     textcolor(12);
     writeln('Tekan Enter Untuk Kembali!!');
     readln;
     Close(File_Data);
End.