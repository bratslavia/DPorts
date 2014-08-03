--- ffmpeg_movie.c.orig	2014-07-24 01:57:31.000000000 +0800
+++ ffmpeg_movie.c	2014-07-24 02:05:36.823897263 +0800
@@ -315,7 +315,7 @@
     } 
 
     if (persistent) {
-        list_entry *le;
+	zend_rsrc_list_entry *le;
         /* resolve the fully-qualified path name to use as the hash key */
         fullpath = expand_filepath(filename, NULL TSRMLS_CC);
 
@@ -350,7 +350,7 @@
             }
             
         } else { /* no existing persistant movie, create one */
-            list_entry new_le;
+	    zend_rsrc_list_entry new_le;
             ffmovie_ctx = _php_alloc_ffmovie_ctx(1);
 
             if (_php_open_movie_file(ffmovie_ctx, filename)) {
@@ -364,7 +364,7 @@
             new_le.ptr = ffmovie_ctx;
 
             if (FAILURE == zend_hash_update(&EG(persistent_list), hashkey, 
-                        hashkey_length+1, (void *)&new_le, sizeof(list_entry),
+                        hashkey_length+1, (void *)&new_le, sizeof(zend_rsrc_list_entry),
                         NULL)) {
                 php_error_docref(NULL TSRMLS_CC, E_WARNING, 
                         "Failed to register persistent resource");
@@ -508,7 +508,7 @@
                     codec_id));
 
         if (!decoder) {
-            zend_error(E_ERROR, "Could not find decoder for %s", 
+            zend_error(E_WARNING, "Could not find decoder for %s", 
                     _php_get_filename(ffmovie_ctx));
             return NULL;
         }
@@ -964,12 +964,14 @@
     /* Copied from libavcodec/utils.c::avcodec_string */
     if (p) {
         codec_name = p->name;
+/*
         if (decoder_ctx->codec_id == CODEC_ID_MP3) {
             if (decoder_ctx->sub_id == 2)
                 codec_name = "mp2";
             else if (decoder_ctx->sub_id == 1)
                 codec_name = "mp1";
         }
+ */
     } else if (decoder_ctx->codec_id == CODEC_ID_MPEG2TS) {
         /* fake mpeg2 transport stream codec (currently not registered) */
         codec_name = "mpeg2ts";
