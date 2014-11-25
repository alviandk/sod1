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
		Rewrite(file_nilai); 
		
	Repeat 
		Clrscr; 
		Ada:=False; 
		i:=0; 
		Gotoxy(30,1);Write('TAMBAH DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('NPM                     : ');Readln(npmcari); 
	While (Ada=False) And (i<>Filesize(file_nilai)) Do
		Begin 
			Seek(file_nilai,i); 
			Read(file_nilai,nilai_mhs); 
			If nilai_mhs.NPM=npmcari Then 
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
			Seek(file_nilai,Filesize(file_nilai)); 
			nilai_mhs.NPM:=npmcari; 
			Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(nilai_mhs.Nama); 	
			Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(nilai_mhs.tgl_lhr); 
			Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(nilai_mhs.no_rumah); 
			Write(file_nilai,nilai_mhs); 
		End; 
	Gotoxy(20,10);Write('Mau  Tambah  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey); 
	Until Lagi<>'Y'; 
	Close(file_nilai); 
End.
