from urllib.parse import urlparse
import tempfile
try:
    from google.cloud import storage
    google_storage_installed = True
except ImportError:
    google_storage_installed = False


def download_checkpoint_from_google(checkpoint_path):
    print(f"Downloading checkpoint file from {checkpoint_path}")
    if not google_storage_installed:
        raise ValueError("You must have the google cloud storage package installed, run 'pip install google-cloud-storage' and try again")

    parsed_url = urlparse(checkpoint_path)
    if parsed_url.scheme != "gs":
        raise ValueError("This method can only parse google cloud storage URLs beginning with gs://")

    bucket = parsed_url.netloc
    location = parsed_url.path.strip("/")
    storage_client = storage.Client()
    bucket = storage_client.bucket(bucket)
    blob = bucket.blob(location)
    checkpoint_file = tempfile.NamedTemporaryFile(suffix=".pt", delete=False)
    blob.download_to_file(checkpoint_file)
    checkpoint_file.close()
    return checkpoint_file.name
