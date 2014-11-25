Uses crt;
Type
    Data = record
          NPM     : string [8];
          Nama    : string [25];
          Tgl_Lhr : string [15];
          No_Rmh  : integer;
End;
Var
   File_Data   : File of Data;
   Data_Mhs    : array[1..10] Of Data;
   FileTmp     : File Of Data;
   Lagi,Hapus  : char;
   Ada         : boolean;
   r           : integer;
   crnpm       : string[8];
Procedure Edit;
Begin
     textcolor(13);
     Data_Mhs[r].NPM:=crnpm;
     gotoxy(20,9);
     write('Nama Mahasiswa            : ');Readln(Data_Mhs[r].Nama);
     gotoxy(20,10);
     write('Tanggal Lahir(dd-mm-yyyy) : ');Readln(Data_Mhs[r].Tgl_Lhr);
     gotoxy(20,11);
     write('No Rumah                  : ');Readln(Data_Mhs[r].No_Rmh);
     Seek(File_Data,r);
     write(File_Data,Data_Mhs[r]);
End;
Begin
    Lagi:='Y';
    clrscr;
    Assign(File_Data,'D:\Mhs1.Dat');
    Reset(File_Data);
    If IOResult<>0 Then
       write('Data Masih Kosong!!')
    Else
    Begin
         Repeat
               clrscr;
               Ada:=False;
               r:=0;
               textcolor(11);
               gotoxy(30,1);
	       write('\  EDIT DATA MAHASISWA  /');
               textcolor(5);
               gotoxy(31,2);
               write('=======================');
               gotoxy(20,4);
               textcolor(14);
	       write('NPM              : ');Readln(crnpm);
               while (Ada=False) and (r<>FileSize(File_Data)) do
                     Begin
                          Seek(File_Data,r);
                          Read(File_Data,Data_Mhs[r]);
                          If Data_Mhs[r].NPM=crnpm Then
                             Begin
                                  Ada:=True;
                                  textcolor(14);
                                  gotoxy(20,5);
	                          write('Nama Mahasiswa   : ',Data_Mhs[r].Nama);
                                  gotoxy(20,6);Write('Tanggal Lahir    : ',Data_Mhs[r].Tgl_Lhr);
                                  gotoxy(20,6);
	                          write('Tanggal Lahir    : ',Data_Mhs[r].Tgl_Lhr);
	                          gotoxy(20,7);
	                          write('No Rumah         : ',Data_Mhs[r].No_Rmh);
                             End
                          Else
                          Inc(r);
                     End;
                     If (Ada=True) Then
                        Edit
                     Else
                         Begin
                              textcolor(12);
	                      gotoxy(15,13);
	                      write('NPM  "',crnpm,'" Tidak Ada!');
                         End;
	                 textcolor(14);
    	                 gotoxy(15,15);
	                 write('Ingin Edit Data Lagi [Y/T]: ');
                         Lagi:=Upcase(Readkey);
         Until Lagi<>'Y';
         End;
Close(File_Data);
End.