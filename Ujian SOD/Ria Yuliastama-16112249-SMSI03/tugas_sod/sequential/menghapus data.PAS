Uses crt;
Type
    Data = record
          NPM     : string [8];
          Nama    : string [25];
          Tgl_Lhr : string [15];
          No_Rmh  : integer;
    End;
Var
   File_Data     : File of Data;
   Data_Mhs      : Data;
   FileTmp       : File of Data;
   Lagi,Hapus    : char;
   Ada           : boolean;
   a             : integer;
   crnpm         : string[8];
Begin
     Lagi:='Y';
     clrscr;
     Repeat
           Assign(File_Data,'D:\Mhs.Dat');
	   Reset(File_Data);
	   If IOResult<>0 Then
	      write('Data Masih Kosong!')
	   Else
	       Begin
	            clrscr;
		    Assign(FileTmp,'D:\Mhs.Tmp');
		    Rewrite(FileTmp);
		    Ada:=False;
		    a:=0;
                    textcolor(5);
		    gotoxy(30,1);
                    write('\HAPUS DATA MAHASISWA/');
		    gotoxy(31,2);
                    write('--------------------');
                    textcolor(15);
		    gotoxy(20,4);write('NPM                  : ');Readln(crnpm);
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
                             gotoxy(20,5);
                             write('Nama                 : ',Data_Mhs.Nama);
                             gotoxy(20,6);
                             write('Tanggal Lahir        : ',Data_Mhs.Tgl_Lhr);
                             gotoxy(20,7);
                             write('No Rumah             : ',Data_Mhs.No_Rmh);
                             textcolor(16);
                             gotoxy(20,10);
                             write('Data Ini Akan Di Hapus [Y/T]:');Readln(Hapus);
                             If Upcase(Hapus)='Y' Then
                                Begin
                                     For a := 1 to FileSize(File_Data) Do
                                     Begin
	                                  Seek(File_Data,a-1);
	                                  Read(File_Data,Data_Mhs);
	                                  If Data_Mhs.NPM<>crnpm Then
	                                     write(FileTmp,Data_Mhs);
	                             End;
                                     Close(File_Data);
                                     Assign(File_Data,'D:\Mhs.Dat');
	                             Erase(File_Data);
	                             Assign(FileTmp,'D:\Mhs.Tmp');
	                             Rename(FileTmp,'D:\Mhs.Dat');
                                     textcolor(9);
	                             gotoxy(20,10);
                                     write('NPM  "',crnpm,'"  Sudah Di Hapus!');
                                End;
                    End Else
                    Begin
                         textcolor(12);
                         gotoxy(20,10);
                         write('NPM  "',crnpm,'"  Tidak Ada!');
                    End;
                    textcolor(11);
                    gotoxy(20,12);
	            write('Apakah Anda Ingin Hapus Data Lagi [Y/T]: ');
                    Lagi:=Upcase(Readkey);
End;

     Until Lagi<>'Y';
End.