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
	 
	Lagi:='Y'; 
	Clrscr; 

	Assign(File_nilai,'D:\Mhs.Dat');
	Reset(File_nilai); 
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
				While (Ada=False) And (i<>Filesize(file_nilai)) Do
					Begin
						Seek(file_nilai,i);
						Read(file_nilai,nilai_mhs);
						If nilai_mhs.npm=npmcari Then
							Begin
							Ada:=True;
							Gotoxy(20,5);Write('Nama Mahasiswa   : ',nilai_mhs.Nama);
							Gotoxy(20,6);Write('Tanggal Lahir    : ',nilai_mhs.tgl_lhr);
							Gotoxy(20,7);Write('No Rumah         : ',nilai_mhs.no_rumah);
							End
						Else
							Inc(i);
					End;
			If (Ada=True) Then
				Begin
				nilai_mhs.npm:=npmcari;
				Gotoxy(20,9);Write('Nama Mahasiswa   : ');Readln(nilai_mhs.Nama);
				Gotoxy(20,10);Write('Tanggal Lahir    : ');Readln(nilai_mhs.tgl_lhr);
				Gotoxy(20,11);Write('No Rumah         : ');Readln(nilai_mhs.no_rumah);
				Seek(file_nilai,i);
				Write(file_nilai,nilai_mhs);
			End
			Else
				Begin
					Gotoxy(20,13);Write('NPM  "',npmcari,'"  Ini  Tidak Ada!');
				End;
			Gotoxy(20,14);Write('Mau  Edit  Data  Lagi  [Y/T]: ');
			Lagi:=Upcase(Readkey);
		Until Lagi<>'Y';
	End;
Close(file_nilai);
End.