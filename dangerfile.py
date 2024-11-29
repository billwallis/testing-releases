from danger_python import Danger, warn

danger = Danger()

if danger.git.modified_files:
    warn("We expect this to fail.")
