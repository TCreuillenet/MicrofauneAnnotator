import os

from django.conf import settings
from django.core.management.base import BaseCommand

from django.contrib.auth.models import User
from annotate.models import Project, AudioTrack


class Command(BaseCommand):
    args = ''
    help = 'populate the database with toy data'

    def handle(self, *args, **options):
        if not User.objects.filter(username="admin").exists():
            User.objects.create_user(username="admin", password="microfaune",
                                    is_superuser=True, is_staff=True)

        if not User.objects.filter(username="annotator").exists():
            user = User.objects.create_user(username="annotator",
                                            password="microfaune")

        if not Project.objects.filter(name="CiteU").exists():
            project = Project.objects.create(name="CiteU", user=user)

        for audio_file in os.listdir(settings.MEDIA_ROOT):
            if not AudioTrack.objects.filter(name=audio_file).exists:
                AudioTrack.objects.create(
                    name=audio_file,
                    file=os.path.join(settings.MEDIA_URL, audio_file),
                    format="wav",
                    project=project,
                    duration=60)
