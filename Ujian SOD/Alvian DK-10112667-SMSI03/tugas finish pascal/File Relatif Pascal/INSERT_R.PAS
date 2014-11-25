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
   mhs,temp            : array[0..20] of tanggal;
   i,jm,j              : integer;
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
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('Ingin Menginsert pada Posisi Data ke          : ');Readln(j);
		clrscr;
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
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
			for i:= jm downto j do
			begin
			mhs[i]:=mhs[i-1];
                        Seek(file_mhs,i);
			write(file_mhs,mhs[i]);
			end;
			Seek(file_mhs,j-1);
			mhs[j-1].NPM:=npmcari;
			Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(mhs[j-1].Nama);
			Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(mhs[j-1].tgl_lhr);
			Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(mhs[j-1].no_rumah);
			write(file_mhs,mhs[j-1]);
		End;
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
	Close(file_mhs);
End.
