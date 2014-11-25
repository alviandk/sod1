uses crt;
type
    nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;

    end;

var
   file_nilai           : file of nilai;
   nilai_mhs            : nilai;
   i                    : integer;
   FileTmp : File of nilai;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];

Begin
	Lagi:='y';
	Clrscr;
	Repeat
		Assign(File_nilai,'D:\Mhs.Dat');

		Reset(File_nilai);

		If IOResult<>0 Then
			Write('Data Masih Kosong...!')
		Else
			Begin
				Clrscr;
				Assign(FileTmp,'D:\Mhs.tmp');
				Rewrite(FileTmp);
				Ada:=False;
				i:=0;
				Gotoxy(30,1);Write('HAPUS DATA MAHASISWA');
				Gotoxy(30,2);Write('=====================');
				Gotoxy(20,4);Write('NPM                  : ');Readln(npmcari);
				While (Ada=False) And (i<>Filesize(file_nilai)) Do
					Begin
						Seek(file_nilai,i);
						Read(file_nilai,nilai_mhs);
						If nilai_mhs.npm=npmcari Then
							Ada:=True
						Else
							Inc(i);
						End;
	              	If (Ada=True) Then
						Begin
							Gotoxy(20,5);Write('Nama nilai           : ',nilai_mhs.Nama);
							Gotoxy(20,6);Write('Tanggal Lahir        : ',nilai_mhs.tgl_lhr);
							Gotoxy(20,7);Write('Nomor Rumah          : ',nilai_mhs.no_rumah);
							Gotoxy(20,10);Write('Data  Ini  Mau  Di  Hapus  [Y/T]:');
							Readln(Hapus);
							If Upcase(Hapus)='Y' Then
								Begin
									For i := 1 to Filesize(file_nilai) Do
										Begin
											Seek(file_nilai,i-1);
											Read(file_nilai,nilai_mhs);
											If nilai_mhs.NPM<>npmcari Then
											Write(FileTmp,nilai_mhs);
										End;
									Close(file_nilai);
									Assign(file_nilai,'D:\mhs.Dat');
									Erase(file_nilai);
									Assign(FileTmp,'D:\mhs.tmp');
									Rename(FileTmp,'D:\mhs.Dat');
									Gotoxy(20,10);Write('NPM  "',npmcari,'"  Sudah Di Hapus!');
								End;
							End
						Else
							Begin
								Gotoxy(20,10);Write('NPM  "',npmcari,'"  Ini  Tidak Ada!');
							End;	
							Gotoxy(20,11);Write('Mau  Hapus  Data  Lagi  [Y/T]: ');Lagi:=Upcase(Readkey);
						End;
								
	Until Lagi<>'Y';
	End.