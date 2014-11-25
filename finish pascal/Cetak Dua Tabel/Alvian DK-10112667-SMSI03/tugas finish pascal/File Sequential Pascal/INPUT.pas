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
       i,j                  : integer;
       lagi              : char;

      begin
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
   end.
