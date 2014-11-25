uses crt;
type

    nilai = record
          nama    : string [25];
          npm     : string [8];
          usia :  integer;

    end;

var
   file_nilai           : file of nilai;
   nilai_mhs            : nilai;
   i,j                  : integer;


begin
     assign (file_nilai,'D:\mahasii.dat');
     rewrite(file_nilai);

     For i:=1 to 5 do
          begin
           clrscr;
           writeln('Mengisi data pada File Mhs.dat');
           writeln;
           writeln('Mengisi data ke ',i);
           writeln;
           with nilai_mhs do
           begin
                write('Nama   : ');readln(nama);
                write('Npm    : ');readln(npm);
                write('Usia   : ');readln(usia);
           end;
		   writeln;

           write(file_nilai,nilai_mhs);
           readln;
                clrscr;
           end;
     close(file_nilai);
end.