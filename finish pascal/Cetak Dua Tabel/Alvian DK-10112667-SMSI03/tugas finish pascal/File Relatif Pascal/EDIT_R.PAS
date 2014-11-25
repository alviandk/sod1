uses crt;
type
    tanggal = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;

    end;

var
   file_mhs 	: file of tanggal;
   mhs         	: array[0..20] of tanggal;
   i           	: integer;
   FileTmp 		: File of tanggal;
   Lagi,Hapus	: Char;
   Ada 			: Boolean;
   npmcari 		: string[8];
Begin 
	 
	Lagi:='Y'; 
	Clrscr; 

	Assign(file_mhs,'D:\f_mhs.Dat');
	Reset(file_mhs);
	If IOResult<>0 Then 
	Write('Data Masih Kosong...!') 
	Else 
		Begin 
			Repeat 
				Clrscr;
				Ada:=False; 
				i:=0; 
				Gotoxy(30,1);Write('EDIT DATA MAHASISWA'); 
				Gotoxy(30,2);Write('=====================');
				Gotoxy(20,4);Write('NPM              : ');Readln(npmcari);
				While (Ada=False) And (i<>Filesize(file_mhs)) Do
					Begin
						Seek(file_mhs,i);
						Read(file_mhs,mhs[i]);
						If mhs[i].npm=npmcari Then
							Begin
							Ada:=True;
							Gotoxy(20,5);Write('Nama Mahasiswa   : ',mhs[i].Nama);
							Gotoxy(20,6);Write('Tanggal Lahir    : ',mhs[i].tgl_lhr);
							Gotoxy(20,7);Write('No Rumah         : ',mhs[i].no_rumah);
							End
						Else
							Inc(i);
					End;
			If (Ada=True) Then
				Begin
				mhs[i].npm:=npmcari;
				Gotoxy(20,9);Write('Nama Mahasiswa   : ');Readln(mhs[i].Nama);
				Gotoxy(20,10);Write('Tanggal Lahir    : ');Readln(mhs[i].tgl_lhr);
				Gotoxy(20,11);Write('No Rumah         : ');Readln(mhs[i].no_rumah);
				Seek(file_mhs,i);
				Write(file_mhs,mhs[i]);
			End
			Else
				Begin
					Gotoxy(20,13);Write('NPM  "',npmcari,'"  Ini  Tidak Ada!');
				End;
			Gotoxy(20,14);Write('Mau  Edit  Data  Lagi  [Y/T]: ');
			Lagi:=Upcase(Readkey);
		Until Lagi<>'Y';
	End;
Close(file_mhs);
End.