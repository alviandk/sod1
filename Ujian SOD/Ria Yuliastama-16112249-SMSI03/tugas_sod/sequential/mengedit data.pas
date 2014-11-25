Uses crt;
Type
    Data = record
          NPM      : string [8];
          Nama     : string [25];
          Tgl_Lhr  : string [15];
          No_Rmh   : integer;
    End;
Var
   File_Data    : File of Data;
   Data_Mhs     : Data;
   FileTmp	: File of Data;
   Lagi,Hapus   : char;
   Ada          : boolean;
   a            : integer;
   crnpm        : string[8];
Procedure Ulang;
Begin
     textcolor(13);
     Data_Mhs.NPM:=crnpm;
     gotoxy(20,9);
     write('Nama Mahasiswa               : ');Readln(Data_Mhs.Nama);
     gotoxy(20,10);
     write('Tanggal Lahir(dd-mm-yyyy)    : ');Readln(Data_Mhs.Tgl_Lhr);
     gotoxy(20,11);
     write('No Rumah                     : ');Readln(Data_Mhs.No_Rmh);
     Seek(File_Data,a);
     write(File_Data,Data_Mhs);
End;
Begin
     Lagi:='Y';
     clrscr;
     Assign(File_Data,'D:\Mhs.Dat');
     Reset(File_Data);
     If IOResult<>0 Then
        write('Data Masih Kosong!!')
     Else
	 Begin
	      Repeat
	            clrscr;
	            Ada:=False;
 	            a:=0;
                    textcolor(11);
	            gotoxy(30,1);
                    write('\EDIT DATA MAHASISWA/');
	            gotoxy(31,2);
                    write('-------------------');
                    textcolor(9);
	            gotoxy(20,4);
                    write('NPM              : ');Readln(crnpm);
	            while (Ada=False) And (a<>FileSize(File_Data)) Do
	                  Begin
	                       Seek(File_Data,a);
		               Read(File_Data,Data_Mhs);
		               If Data_Mhs.NPM=crnpm Then
		                  Begin
			               Ada:=True;
			               gotoxy(20,5);
                                       write('Nama Mahasiswa   : ',Data_Mhs.Nama);
			               gotoxy(20,6);
                                       write('Tanggal Lahir    : ',Data_Mhs.Tgl_Lhr);
			               gotoxy(20,7);
                                       write('No Rumah         : ',Data_mhs.No_Rmh);
                                  End
                               Else
		                   Inc(a);
	                  End;
	                  If (Ada=True) Then
	                     Ulang
                          Else
	                      Begin
                                   textcolor(12);
		                   gotoxy(15,13);
                                   write('NPM  "',crnpm,'" Tidak Ada!');
		              End;
                              textcolor(14);
		              gotoxy(15,15);
                              write('Ingin  Edit  Data  Lagi  [Y/T]: ');
                              Lagi:=Upcase(Readkey);
              Until Lagi<>'Y';
	      End;
              Close(File_Data);
End.