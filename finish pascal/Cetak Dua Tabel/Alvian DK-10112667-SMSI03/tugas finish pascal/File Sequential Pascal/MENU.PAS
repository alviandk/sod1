Program Data_Mahasiswa; 
uses crt;

    type
          nilai = record
          nama    : string [25];
          npm     : string [8];
          tgl_lhr : string [10];
          no_rumah : integer;
    end;


   var
       file_nilai    : file of nilai;
       nilai_mhs  : nilai;
       Pil,Ul : Char;
	   
	   
Procedure Menu; 
Begin 
	Clrscr; 
	Gotoxy(34,1);Write('MENU PILIHAN'); 
	Gotoxy(34,2);Write('============'); 
	Gotoxy(27,4);Write('1. Input Data Mahasiswa'); 
	Gotoxy(27,5);Write('2. Output Data Mahasiswa'); 
	Gotoxy(27,6);Write('3. Hapus Data Mahasiswa'); 
	Gotoxy(27,7);Write('4. Edit Data Mahasiswa'); 
	Gotoxy(27,8);Write('5. Insert Data Mahasiswa'); 
	Gotoxy(27,9);Write('6. Tambah Data Mahasiswa'); 
	Gotoxy(27,10);Write('7. Keluar (Exit)'); 
	Gotoxy(32,12);Write('Pilihan [1..7]: ');Pil:=Readkey; 
End;

Procedure Input; 
Var 
		i,j               : integer;
		lagi              : char;
		
		begin
			Ul:='Y'; 
           assign (file_nilai,'D:\mhs.dat');
           rewrite(file_nilai);
           i:=0;
           repeat
               i:=i+1;
              clrscr;
              writeln('Mengisi data pada File Mhs.dat');
              writeln;
              writeln('Mengisi data ke ',i);
              writeln;
              with nilai_mhs do
              begin
                   write('Nama                        : ');readln(nama);
                   write('Npm                         : ');readln(npm);
                   write('Tanggal Lahir(dd/mm/yyyy)   : ');read(tgl_lhr);
                   write('No Rumah                    : ');readln(no_rumah);
              end;
              write(file_nilai,nilai_mhs);
              writeln;
              write('Isi lagi?(y/t) : ');readln(lagi);
        until lagi = 't';
        clrscr;
        close(file_nilai);
   end;

Procedure Output; 
Var 
		i,j,jm               : integer;
		lagi                 : char;
const
    garis='--------------------------------------------------------------------';

   begin
     Ul:='Y'; 
	 assign(file_nilai,'D:\Mhs.dat');
     reset(file_nilai);
     jm:=filesize(file_nilai);
     clrscr;
     writeln(' ':25,'Data Mahasiswa SMSI03');
     writeln(' ':25,'---------------------');
     writeln;
     writeln(garis);
     writeln('|No|       Nama       |     NPM     |  Tanggal Lahir  |  No Rumah  |');
     writeln(garis);
     for j:= 1 to jm do
     begin
          gotoxy(1,wherey);write('|',j);gotoxy(4,wherey);write('|');
          read(file_nilai,nilai_mhs);
          with nilai_mhs do
          begin
             gotoxy(6,wherey);write(nama);
             gotoxy(23,wherey);write('|  ',npm);
             gotoxy(37,wherey);write('| ',tgl_lhr);
             gotoxy(55,wherey);write('| ',no_rumah);gotoxy(68,wherey);write('|');
          end;
          writeln;
     end;

     writeln(garis);
     close(file_nilai);
     readln;
   end;

 Procedure Hapus;
 var
 i                    : integer;
   FileTmp : File of nilai;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];

Begin
	Ul:='Y'; 
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
	End;
 
 Procedure Edit;
 var
	i                    : integer;
   FileTmp : File of nilai;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];
Begin 
	 Ul:='Y'; 
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
End;

Procedure Insert;
var
   i,it,j                    : integer;
   FileTmp : File of nilai;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];
Begin  
	Ul:='Y'; 
	Lagi:='Y'; 
	 		
	Repeat 
	Clrscr;
	Assign(File_nilai,'D:\Mhs.Dat');
	Reset(File_nilai);
	If IOResult<>0 Then 
		Rewrite(file_nilai); 
	
	Clrscr; 
		Assign(FileTmp,'D:\tmp.dat');
		Rewrite(FileTmp);

		Ada:=False; 
		i:=0; 
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('Ingin Menginsert pada Posisi Data ke          : ');Readln(j);
		
		clrscr;
		Gotoxy(30,1);Write('INSERT DATA MAHASISWA'); 
		Gotoxy(30,2);Write('====================='); 
		Gotoxy(20,4);Write('NPM                         : ');Readln(npmcari);
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
		if j>1 then
			Begin   {program utama} 
				for i:= 1 to j-1 do {copy atas insert}
				begin		
				Seek(file_nilai,i-1);
				read(file_nilai,nilai_mhs);
				write(filetmp,nilai_mhs);
				end;
			
				seek(filetmp,filesize(filetmp)); {insert}
				nilai_mhs.NPM:=npmcari; 
				Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(nilai_mhs.Nama); 	
				Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(nilai_mhs.tgl_lhr);
				Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(nilai_mhs.no_rumah);
				Write(filetmp,nilai_mhs);
	
				For i := j to Filesize(file_nilai) Do {copy bawah insert}
					Begin
						Seek(file_nilai,i-1);
						Read(file_nilai,nilai_mhs);
						seek(filetmp,i);
						Write(FileTmp,nilai_mhs);
					End;
			
				Assign(FileTmp,'D:\tmp.dat'); {ubah file}
				reset(filetmp);
				Assign(file_nilai,'D:\mhs.Dat');
				rewrite(file_nilai);
				For i := 1 to Filesize(filetmp) Do
					Begin
						Seek(filetmp,i-1);
						Read(filetmp,nilai_mhs);
						Write(File_nilai,nilai_mhs);
				end;
				close(file_nilai);
				close(filetmp);
				Gotoxy(20,10);Write('NPM  "',npmcari,'"  Sudah Di Insert!');
			end
		else
			begin
				seek(filetmp,0); {insert}
				nilai_mhs.NPM:=npmcari; 
				Gotoxy(20,5);Write('Nama Mahasiswa              : ');Readln(nilai_mhs.Nama); 	
				Gotoxy(20,6);Write('Tanggal Lahir (dd/mm/yyyy)  : ');Readln(nilai_mhs.tgl_lhr);
				Gotoxy(20,7);Write('Nomor Rumah                 : ');Readln(nilai_mhs.no_rumah);
				Write(filetmp,nilai_mhs);
			For i := 1 to Filesize(file_nilai) Do {copy bawah insert}
				Begin
					Seek(file_nilai,i-1);
					Read(file_nilai,nilai_mhs);
					seek(filetmp,i);
					Write(FileTmp,nilai_mhs);
				End;
			Assign(FileTmp,'D:\tmp.dat'); {ubah file}
			reset(filetmp);
			Assign(file_nilai,'D:\mhs.Dat');
			rewrite(file_nilai);
			For i := 1 to Filesize(filetmp) Do
				Begin
					Seek(filetmp,i-1);
					Read(filetmp,nilai_mhs);
					Write(File_nilai,nilai_mhs);
				end;
			close(file_nilai);
			close(filetmp);
			Gotoxy(20,10);Write('NPM  "',npmcari,'"  Sudah Di Insert!');
		end;

	Gotoxy(20,10);Write('Mau  INSERT  Data  Lagi  [Y/T]: ');
	Lagi:=Upcase(Readkey);
	Until Lagi<>'Y';
End;

Procedure Tambah;
var
i                    : integer;
   FileTmp : File of nilai;
   Lagi,Hapus: Char;
   Ada : Boolean;
   npmcari : string[8];
Begin  
	Ul:='Y'; 
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
		Gotoxy(20,4);Write('NPM                         : ');Readln(npmcari);
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
End;

Begin 
	Repeat 
	Menu; 
	Case Pil Of 
		'1' : Input; 
		'2' : Output; 
		'3' : Hapus; 
		'4' : Edit; 
		'5' : Insert; 
		'6' : Tambah; 
		End; 
	Until (Ul<>'Y') Or (Pil='7');
End. 
