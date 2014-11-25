uses crt;
type
    tanggal = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;

    end;

var
   file_mhs           : file of tanggal;
   mhs            : array[0..20] of tanggal;
   i                    : integer;
   FileTmp : File of tanggal;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];

Begin
	Lagi:='y';
	Clrscr;
	Repeat
		Assign(file_mhs,'D:\f_mhs.Dat');

		Reset(file_mhs);

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
				While (Ada=False) And (i<>Filesize(file_mhs)) Do
				Begin
					Seek(file_mhs,i);
					Read(file_mhs,mhs[i]);
					If mhs[i].npm=npmcari Then
						Ada:=True
					Else
						Inc(i);
				End;
	              	If (Ada=True) Then
			Begin
			Gotoxy(20,5);Write('Nama tanggal         : ',mhs[i].Nama);
			Gotoxy(20,6);Write('Tanggal Lahir        : ',mhs[i].tgl_lhr);
			Gotoxy(20,7);Write('Nomor Rumah          : ',mhs[i].no_rumah);
			Gotoxy(20,10);Write('Data  Ini  Mau  Di  Hapus  [Y/T]:');
			Readln(Hapus);
			If Upcase(Hapus)='Y' Then
			Begin
				For i := 0 to Filesize(file_mhs)-1 Do
			Begin
			Seek(file_mhs,i);
			Read(file_mhs,mhs[i]);
			If mhs[i].NPM<>npmcari Then
			Write(FileTmp,mhs[i]);
			End;
			Close(file_mhs);
			Assign(file_mhs,'D:\f_mhs.Dat');
			Erase(file_mhs);
			Assign(FileTmp,'D:\mhs.tmp');
			Rename(FileTmp,'D:\f_mhs.Dat');
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