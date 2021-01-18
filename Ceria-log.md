Senin 18 Januari 2021: # Perubahan versi gradle untuk android
    1. Pada android/build.gradle  => gradle version diubah dari 3.5.0 ke 4.1.1 ("com.android.tools.build:gradle:4.1.1")
    2. Pada android/gradle/wrapper/gradle-wrapper.properties = > distributionurl nya diubah dari 5.6-all.zip jadi 6.5-all.zip (""distributionUrl=https\://services.gradle.org/distributions/gradle-6.5-all.zip)
    3. Pada android/app/build.gradle => ditambahkan (ndkVersion "22.0.7026061") dan juga 
        ```ndk {
                debugSymbolLevel 'SYMBOL_TABLE'
            }``` pada buildTypes{ relese { ... ```ndk{...}``` }  }

    4. Konsekuensi nya semua jalan dengan baik, namun untuk build/run --release , harus jalankan build/run --profile dulu , kemudian baru bisa jalanin build/run --release.
        Untuk file symbol yang diperlukan oleh playstore sudah di cakupkan pada file .aab nanti pada saat build appbundle.