# create a bucket
resource "google_storage_bucket" "website_bucket" {
  name = "hello-world-website"
  location = "AU"
}

# upload the static website to the bucket
resource "google_storage_bucket_object" "website_content" {
  name = "index.html"
  source = "../website/index.html"
  bucket = google_storage_bucket.website_bucket.name
}

# Make website public
resource "google_storage_object_access_control" "public_rule" {
 bucket = google_storage_bucket.website_bucket.name
 object = google_storage_bucket_object.website_content.name
 role = "READER"
 entity = "allUsers"
}