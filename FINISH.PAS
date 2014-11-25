Program Data_Mahasiswa; 
Uses Crt;
Type Mahasiswa = Record 
	NoMhs : Word; 
	Nama : String[20]; 
	IPK : Real; 
	Usia : Byte; 
End;

Var Filemhs : File of Mahasiswa; 
	Data : Mahasiswa; 
	Pil,Ul : Char; 

Procedure Menu; 
Begin 
	Clrscr; 
	Gotoxy(34,1);Write('MENU PILIHAN'); 
	Gotoxy(34,2);Write('============'); 
	Gotoxy(27,4);Write('1. Tambah Data Mahasiswa'); 
	Gotoxy(27,5);Write('2. Edit Data Mahasiswa'); 
	Gotoxy(27,6);Write('3. Hapus Data Mahasiswa'); 
	Gotoxy(27,7);Write('4. Tampilkan Data Mahasiswa'); 
	Gotoxy(27,8);Write('5. View Mahasiswa BerdasarkanUmur'); 
	Gotoxy(27,9);Write('6. Hapus NoMhs Ganjil'); 
	Gotoxy(27,10);Write('9. Keluar (Exit)'); 
	Gotoxy(32,12);Write('Pilihan [1..9]: ');Pil:=Readkey; 
End;

Procedure BukaFile; 
Begin 
	Assign(FileMhs,'D:\Mhas.Dat'); 
	{$I-}; 
	Reset(FileMhs); 
	{$I+}; 
End; 

Procedure Tambah; 
Var Lagi: Char; 
	Ada : Boolean; 
	i : Integer; 
	NOCR: Word; 
Begin 
	Ul:='Y'; 
	Lagi:='Y'; 
	Clrscr; 	
	BukaFile; 
	If IOResult<>0 Then 
		Rewrite(FileMhs); 
		
	Repeat 
		Clrscr; 
		Ada:=False; 
		i:=0; 
		Gotoxy(30,1);Write('TAMBAH DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('No. Mahasiswa : ');Readln(NOCR); 
	While (Ada=False) And (i<>Filesize(FileMhs)) Do
		Begin 
			Seek(FileMhs,i); 
			Read(FileMhs,Data); 
			If Data.NoMhs=NOCR Then 
				Ada:=True 
			Else 
				Inc(i); 
		End; 

	If (Ada=True) Then 
		Begin 
		Gotoxy(20,9);Write('Nomor  Mahasiswa  "',NOCR,'"  Ini  Sudah Ada!'); 
		End 
	Else 
		Begin 
			Seek(FileMhs,Filesize(FileMhs)); 
			Data.NoMhs:=NOCR; 
			Gotoxy(20,5);Write('Nama Mahasiswa : ');Readln(Data.Nama); 	
			Gotoxy(20,6);Write('IPK : ');Readln(Data.IPK); 
			Gotoxy(20,7);Write('Umur : ');Readln(Data.Usia); 
			Write(FileMhs,Data); 
		End; 
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey); 
	Until Lagi<>'Y'; 
	Close(FileMhs); 
End;
 
Procedure Edit; 
Var Lagi: Char; 
	Ada : Boolean; 
	i : Integer; 
	NOCR: Word; 
Begin 
	Ul:='Y'; 
	Lagi:='Y'; 
	Clrscr; 

	BukaFile; 
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
				Gotoxy(20,4);Write('No. Mahasiswa : ');Readln(NOCR); 
				While (Ada=False) And (i<>Filesize(FileMhs)) Do 
					Begin 
						Seek(FileMhs,i); 
						Read(FileMhs,Data); 
						If Data.NoMhs=NOCR Then 
							Begin 
							Ada:=True; 
							Gotoxy(20,5);Write('Nama Mahasiswa: ',Data.Nama); 
							Gotoxy(20,6);Write('IPK  : ',Data.IPK:1:2); 
							Gotoxy(20,7);Write('Umur  : ',Data.Usia); 
							End 
						Else
							Inc(i); 
					End; 
			If (Ada=True) Then 
				Begin 
				Data.NoMhs:=NOCR; 
				Gotoxy(20,9);Write('Nama Mahasiswa : ');Readln(Data.Nama); 
				Gotoxy(20,10);Write('IPK : ');Readln(Data.IPK);
				Gotoxy(20,11);Write('Umur            : ');Readln(Data.Usia); 
				Seek(FileMhs,i); 
				Write(FileMhs,Data); 
			End
			Else 
				Begin
					Gotoxy(20,13);Write('Nomor  Mahasiswa  "',NOCR,'"  Ini  Tidak Ada!'); 
				End; 
			Gotoxy(20,14);Write('Mau  Edit  Data  Lagi  [Y/T]: ');
			Lagi:=Upcase(Readkey);
		Until Lagi<>'Y';
	End; 
Close(FileMhs); 
End; 

Procedure Hapus; 
Var FileTmp : File of Mahasiswa; 
	Lagi,Hapus: Char; 
	Ada : Boolean; 
	i : Integer; 
	NOCR : Word; 
Begin 
	Ul:='Y'; 
	Lagi:='Y'; 
	Clrscr; 
	Repeat 
		BukaFile; 
		If IOResult<>0 Then 
		Write('Data Masih Kosong...!') 
	Else 
		Begin 
			Clrscr; 
			Assign(FileTmp,'D:\Mhas.tmp'); 
			Rewrite(FileTmp); 
			Ada:=False; 
			i:=0; 
			Gotoxy(30,1);Write('HAPUS DATA MAHASISWA');
			Gotoxy(30,2);Write('====================='); 
			Gotoxy(20,4);Write('No. Mahasiswa : ');Readln(NOCR); 
			While (Ada=False) And (i<>Filesize(FileMhs)) Do 
				Begin 
				Seek(FileMhs,i); 
				Read(FileMhs,Data); 
				If Data.NoMhs=NOCR Then 
					Ada:=True 
				Else 
					Inc(i); 
				End; 
			If (Ada=True) Then 
			Begin 
				Gotoxy(20,5);Write('Nama Mahasiswa : ',Data.Nama); 
				Gotoxy(20,6);Write('IPK : ',Data.IPK:1:2); 
				Gotoxy(20,7);Write('Umur : ',Data.Usia); 
				Gotoxy(20,9);Write('Data  Ini  Mau  Di  Hapus  [Y/T]:');
				Readln(Hapus); 
				If Upcase(Hapus)='Y' Then 
				Begin
				For i := 1 to Filesize(FileMhs) Do 
				Begin 
					Seek(FileMhs,i-1); 
					Read(FileMhs,Data); 
					If Data.NoMhs<>NOCR Then 
						Write(FileTmp,Data); 
					End; 
				Close(FileMhs); 
				Assign(FileMhs,'D:\Mhas.Dat'); 
				Erase(FileMhs); 
				Assign(FileTmp,'D:\Mhas.tmp'); 
				Rename(FileTmp,'D:\Mhas.Dat'); 
				Gotoxy(20,10);Write('Nomor  Mahasiswa  "',NOCR,'"  Sudah Di Hapus!'); 
			End; 
		End 
	Else 
		Begin 
			Gotoxy(20,10);Write('Nomor  Mahasiswa  "',NOCR,'"  Ini  Tidak Ada!'); 
		End; 
	Gotoxy(20,11);Write('Mau  Hapus  Data  Lagi  [Y/T]: ');Lagi:=Upcase(Readkey);
End; 
Until Lagi<>'Y'; 
End; 



Function RataIPK(TIPK:Real;n:integer):Real; 
Begin 
	RataIPK:=TIPK/n; 
End; 


Procedure Tampil; 
Var i : Integer; 
	TIPK : Real; 
Begin 
	Ul:='Y'; 
	TIPK:=0; 
	BukaFile; 
	If IoResult <> 0 Then 
		Write('Maaf Data Masih Kosong ! ') 
	Else 
	Begin 
		Clrscr; 
		Writeln(' DATA MAHASISWA  '); 
		Writeln; 
		Writeln('================================================'); 
		Writeln(' NO NIM NAMA IPKUMUR '); 
		Writeln('================================================'); 
		i:=0; 
		While Not EoF(FileMhs) Do 
		Begin 
			Inc(i); 
			Read(FileMhs,Data); 
			Writeln(i:3,Data.NoMhs:6,Data.Nama:20,Data.IPK:8:2,Data.Usia:10); 
			TIPK:=TIPK+Data.IPK; 
		End; 
	Writeln('================================================');
	Writeln('Rata-Rata IPK: ',RataIPK(TIPK,i):1:2); 
	Writeln('================================================'); 
	Close(FileMhs); 
End; 
Writeln; 
Write('Press Any Key to Continue...');Readkey; 
End; 


Procedure View_Umur; 
Var i : Integer; 
	Umur : Byte; 
	Lagi : Char; 
Begin 
	Ul:='Y';
	Lagi:='Y'; 
	Repeat 
		Clrscr; 
		Write('Tampilkan Umur Besar Dari: ');Readln(Umur); 
		BukaFile; 
		If IoResult <> 0 Then 
			Write('Maaf Data Masih Kosong ! ') 
		Else 
			Begin 
			Writeln(' DATA MAHASISWA  '); 
			Writeln(' UMUR DI ATAS ',Umur:2,' TAHUN'); 
			Writeln; 
			Writeln('================================================'); 
			Writeln(' NO NIM NAMA IPK UMUR '); 
			Writeln('================================================'); 
			i:=0; 
			While Not EoF(FileMhs) Do 
				Begin 
					Read(FileMhs,Data); 
					If Data.Usia>Umur Then 
						Begin 
							Inc(i); 
							Writeln(i:3,Data.NoMhs:6,Data.Nama:20,Data.IPK:8:2,Data.Usia:10); 
						End;
				End; 
			Writeln('================================================'); 
			Close(FileMhs); 
			End; 
		Writeln; 
		Write('Mau Lihat Data Lagi [Y/T]: ');Lagi:=Upcase(Readkey); 
		Until Lagi<>'Y'; 
		End;
		
		

Procedure Hapus_NoMhs; 
Var FileTmp : File of Mahasiswa; 
	Lagi,Hapus: Char; 
	i : Integer; 
Begin 
	Ul:='Y'; 
	Lagi:='Y'; 
	Clrscr; 
	Repeat 
		BukaFile; 
		If IOResult<>0 Then 
			Write('Data Masih Kosong...!') 
		Else
	Begin 
		Clrscr; 
		Assign(FileTmp,'D:\Mhas.tmp'); 
		Rewrite(FileTmp); 
		i:=0; 
		Gotoxy(20,3);Write('Mau  Menghapus  No.  Mahasiswa  Yang  Ganjil [Y/T]: ');Readln(Hapus);
		If Upcase(Hapus)='Y' Then 
			Begin 
				For i := 1 to Filesize(FileMhs) Do 
					Begin 
						Seek(FileMhs,i-1); 
						Read(FileMhs,Data); 
						If (Data.NoMhs Mod 2)=0 Then 
							Write(FileTmp,Data); 
						End; 
						Close(FileMhs); 
						Assign(FileMhs,'D:\Mhas.Dat'); 
						Erase(FileMhs); 
						Assign(FileTmp,'D:\Mhas.tmp'); 
						Rename(FileTmp,'D:\Mhas.Dat'); 
						Gotoxy(20,10);Write('Nomor Mahasiswa Sudah Di Hapus!'); 
					End; 
				Gotoxy(20,11);Write('Mau  Hapus  Data  Lagi  [Y/T]: ');
				Lagi:=Upcase(Readkey); 
			End; 
			Until Lagi<>'Y'; 
		End; 

		
Begin 
	Repeat 
	Menu; 
	Case Pil Of 
		'1' : Tambah; 
		'2' : Edit; 
		'3' : Hapus; 
		'4' : Tampil; 
		'5' : View_Umur; 
		'6' : Hapus_NoMhs; 
		End; 
	Until (Ul<>'Y') Or (Pil='9');
End. 