document.addEventListener("DOMContentLoaded", function () {

  // 1. Cari langsung: tabel tersaring saat mengetik
  var q = document.querySelector('input[name="q"]');
  var rows = document.querySelectorAll("table tr");
  if (q) {
    q.addEventListener("input", function () {
      var k = q.value.toLowerCase();
      rows.forEach(function (r, i) {
        if (i === 0) return; // lewati baris judul
        r.style.display = r.textContent.toLowerCase().indexOf(k) > -1 ? "" : "none";
      });
    });
  }

  // 2. Pesan hijau ("berhasil ditambahkan") hilang sendiri setelah 4 detik
  var ok = document.querySelector(".ok");
  if (ok) {
    setTimeout(function () { ok.style.display = "none"; }, 4000);
  }

  // 3. Halaman antrean memperbarui diri tiap 30 detik
  if (location.pathname.indexOf("antrean.php") > -1) {
    setTimeout(function () {
      location.href = location.pathname + location.search;
    }, 30000);
  }
});