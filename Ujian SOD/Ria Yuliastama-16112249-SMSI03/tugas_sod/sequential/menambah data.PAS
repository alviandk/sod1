Uses crt;
Type
    Data = record
          NPM     : string [8];
          Nama    : string [25];
          Tgl_Lhr : string [15];
          No_Rmh  : integer;
End;
Var
   File_Data      : File of Data;
   Data_Mhs       : Data;
   FileTmp        : File of Data;
   Lagi,Hapus     : char;
   Ada            : boolean;
   a              : integer;
   crnpm          : string[8];
Procedure Tambah;
Begin
     textcolor(14);
     Seek(File_Data,FileSize(File_Data));
     Data_Mhs.NPM:=crnpm;
     gotoxy(20,5);
     write('Nama Mahasiswa             : ');Readln(Data_Mhs.Nama);
     gotoxy(20,6);
     write('Tanggal Lahir (dd-mm-yyyy) : ');Readln(Data_Mhs.Tgl_Lhr);
     gotoxy(20,7);
     write('Nomor Rumah                : ');Readln(Data_Mhs.No_Rmh);
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
	   a:=0;
           textcolor(13);
	   gotoxy(30,1);
           write('\TAMBAH DATA MAHASISWA/');
	   gotoxy(31,2);
           write('---------------------');
           textcolor(14);
	   gotoxy(20,4);
           write('NPM                        : ');Readln(crnpm);
	   while (Ada=False) and (a<>FileSize(File_Data)) do
	   Begin
	        Seek(File_Data,a);
		Read(File_Data,Data_Mhs);
		If Data_Mhs.NPM=crnpm Then
		   Ada:=True
		Else
		    Inc(a);
	   End;
           If (Ada=True) Then
	   Begin
                textcolor(12);
	        gotoxy(14,9);
                write('NPM  "',crnpm,'" Sudah Ada!');
	   End
	   Else
	       Tambah;
	       textcolor(9);
               gotoxy(17,11);
               write('Apakah Anda Ingin Tambah  Data  Lagi  [Y/T]: ');
	       Lagi:=Upcase(Readkey);
     Until Lagi<>'Y';
     Close(File_Data);
End.