uses crt;
type
    tanggal = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;

    end;

var
   file_mhs       : file of tanggal;
   mhs            : array[0..20] of tanggal;
   i,jm              : integer;
   FileTmp        : File of tanggal;
   Lagi,Hapus     : Char;
   Ada            : Boolean;
   npmcari        : string[8];
Begin
	Lagi:='Y';
	Clrscr; 	
	Assign(file_mhs,'D:\f_mhs.Dat');
	Reset(file_mhs);
	If IOResult<>0 Then 
		Rewrite(file_mhs); 
		
	Repeat 
		Clrscr;
		Ada:=False;
		i:=0;
		Gotoxy(30,1);Write('TAMBAH DATA MAHASISWA');
		Gotoxy(30,2);Write('=====================');
		Gotoxy(20,4);Write('NPM                         : ');Readln(npmcari);
	While (Ada=False) And (i<>Filesize(file_mhs)) Do
		Begin
			Seek(file_mhs,i);
			Read(file_mhs,mhs[i]);
			If mhs[i].NPM=npmcari Then
				Ada:=True
			Else
				Inc(i);
		End;

	If (Ada=True) Then
		Begin
		Gotoxy(20,9);Write('NPM  "',npmcari,'"  Ini  Sudah Ada!');
		End
	Else
		Begin
			jm:=filesize(file_mhs);
			Seek(file_mhs,jm);
			mhs[jm].NPM:=npmcari;
			Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(mhs[jm].Nama);
			Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(mhs[jm].tgl_lhr);
			Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(mhs[jm].no_rumah);
			Write(file_mhs,mhs[jm]);
		End;
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
	Close(file_mhs);
End.
