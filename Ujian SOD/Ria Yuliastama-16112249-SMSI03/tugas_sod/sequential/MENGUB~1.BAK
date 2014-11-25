Uses crt;
Type
    Data = record
          NPM     : string [8];
          Nama    : string [25];
          Tgl_Lhr : string [15];
          No_Rmh  : integer;
End;
Var
   File_Data  : File Of Data;
   Data_Mhs   : Data;
   Lagi,Hapus : char;
   Ada 	      : boolean;
   p,q        : integer;
   crnpm      : string[8];
Procedure Ulang;
Begin
     textcolor(13);
     Seek(File_Data,(q-1));
     Data_Mhs.NPM:=crnpm;
     gotoxy(20,5);
     write('Nama Mahasiswa             : ');Readln(Data_Mhs.Nama);
     gotoxy(20,6);
     write('Tanggal Lahir (dd/mm/yyyy) : ');Readln(Data_Mhs.Tgl_Lhr);
     gotoxy(20,7);
     write('No Rumah                   : ');Readln(Data_Mhs.No_Rmh);
     write(File_Data,Data_Mhs);
End;
Begin
     Lagi:='Y';
     clrscr;
     Assign(File_Data,'D:\Mhs.Dat');
     Reset(File_Data);
     If IOResult<>0 Then
     	Rewrite(File_Data);
     Repeat
	   clrscr;
	   Ada:=False;
	   p:=0;
           textcolor(9);
	   gotoxy(30,1);
	   write('\ UBAH DATA MAHASISWA /');
	   gotoxy(31,2);
	   write('---------------------');
           textcolor(14);
	   gotoxy(20,4);
	   write('Ubah Data Urutan ke ? :');Readln(q);
	   clrscr;
           textcolor(9);
	   gotoxy(30,1);
	   write('\ UBAH DATA MAHASISWA /');
	   gotoxy(31,2);
	   write('---------------------');
           textcolor(13);
	   gotoxy(20,4);
	   write('NPM                        : ');Readln(crnpm);
	   while (Ada=False) and (p<>FileSize(File_Data)) do
	   Begin
		Seek(File_Data,p);
		Read(File_Data,Data_Mhs);
		If Data_Mhs.NPM=crnpm Then
		    Ada:=True
		Else
		    Inc(p);
	   End;
	   If (Ada=True) Then
	       Begin
                    textcolor(12);
		    gotoxy(20,9);
		    write('NPM  "',crnpm,'"  Sudah Ada!');
	       End
	   Else
	       Ulang;
               textcolor(11);
	       gotoxy(20,11);
	       write('Apakah Anda Ingin Ubah Data  Lagi  [Y/T]: ');
	       Lagi:=Upcase(Readkey);
     Until Lagi<>'Y';
     Close(File_Data);
End.