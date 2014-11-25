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
   Data_Mhs   : array[1..20] of Data;
   FileTmp    : File Of Data;
   Lagi,Hapus : char;
   Ada        : boolean;
   r          : integer;
   crnpm      : string[8];
Begin
     Lagi:='Y';
     clrscr;
     Repeat
           Assign(File_Data,'D:\Mhs1.Dat');
           Reset(File_Data);
           If IOResult<>0 Then
              write('Data Masih Kosong!')
           Else
               Begin
                    clrscr;
                    Assign(FileTmp,'D:\Mhs1.Tmp');
                    Rewrite(FileTmp);
                    Ada:=False;
                    r:=0;
                    gotoxy(30,1);
                    write('\  HAPUS DATA MAHASISWA  /');
                    gotoxy(31,2);
                    write(' ------------------------');
                    textcolor(15);
                    gotoxy(20,4);
                    write('NPM           : ');Readln(crnpm);
                    while (Ada=False) and (r<>FileSize(File_Data)) do
                          Begin
                               Seek(File_Data,r);
                               Read(File_Data,Data_Mhs[r]);
                               If Data_Mhs[r].NPM=crnpm Then
                                  Ada:=True
                               Else
                                   Inc(r);
                          End;
                          If (Ada=True) Then
                             Begin
                                  gotoxy(20,5);
                                  write('Nama          : ',Data_Mhs[r].Nama);
                                  gotoxy(20,6);
                                  write('Tanggal Lahir : ',Data_Mhs[r].Tgl_Lhr);
                                  gotoxy(20,7);
                                  write('No Rumah      : ',Data_Mhs[r].No_Rmh);
                                  textcolor(16);
                                  gotoxy(20,10);
                                  write('Data  Ini  Akan  Di  Hapus  [Y/T]:');Readln(Hapus);
                                  If Upcase(Hapus)='Y' Then
                                     Begin
                                          For r := 1 to FileSize(File_Data) Do
                                          Begin
                                               Seek(File_Data,r-1);
                                               Read(File_Data,Data_Mhs[r]);
                                               If Data_Mhs[r].NPM<>crnpm Then
                                                  write(FileTmp,Data_Mhs[r]);
                                          End;
                                          Close(File_Data);
                                          Assign(File_Data,'D:\Mhs1.Dat');
                                          Erase(File_Data);
                                          Assign(FileTmp,'D:\Mhs1.Tmp');
                                          Rename(FileTmp,'D:\Mhs1.Dat');
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
                                      gotoxy(23,12);
                                      write('Apakah Anda Ingin Hapus  Data  Lagi  [Y/T]: ');
                                      Lagi:=Upcase(Readkey);
                             End;
     Until Lagi<>'Y';
End.