-- Nama author: ifulxploit
-- Deskripsi: Script untuk membersihkan folder download dengan menghapus file-file yang sudah tertentu lama dan berukuran di bawah batas maksimum.
-- Anda akan diminta memasukkan path folder, waktu terakhir diunduh, dan ukuran file maksimum yang ingin dihapus.

local lfs = require("lfs")

-- Banner logo
print([[
        _nnnn_
       dGGGGMMb     _,,,_
      @p~qp~~qMb  /     \   -=[ Tool penghapus Dosa ]=-
      M|@||@) M| /    (\ \  -=[ Author : IfulXploit ]=-
      @,----.JM| \,----' |
     JS^\__/  qKL\)ZZ[\^\
    dZP            """"  \
   qZI                  L
  <| \.\/                |
  \\;_J                 /
   \_,_____,--'\   /'\_ __,
     \  / |   \,\_/_/   /  \
      \/2__;----'-'----'"""`
]])

-- Meminta masukan dari user
print("Masukkan path folder yang ingin dihapus:")
local folder = io.read()
print("Masukkan waktu terakhir diunduh (dalam hari) yang ingin disimpan:")
local waktu_terakhir_diunduh = tonumber(io.read())
print("Masukkan ukuran file maksimum (dalam megabyte) yang ingin dihapus:")
local ukuran_file_maksimum = tonumber(io.read())

-- Fungsi untuk menghapus file yang lebih tua dari waktu tertentu
function hapus_file_lama(path, days, max_size)
    for file in lfs.dir(path) do
        if file ~= "." and file ~= ".." then
            local f = path.."/"..file
            local attr = lfs.attributes(f)
            if attr.mode == "file" and (os.difftime(os.time(), attr.modification) / (24 * 3600)) > days and attr.size < (max_size * 1024 * 1024) then
                os.remove(f)
                print("File terhapus: "..f)
            end
        end
    end
end

-- Panggil fungsi hapus_file_lama dengan parameter yang sesuai
hapus_file_lama(folder, waktu_terakhir_diunduh, ukuran_file_maksimum)
