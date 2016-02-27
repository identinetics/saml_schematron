import os

class Config(object):
    def __init__(self):
        self.HttpServer = {
            'port': 8080,
            'listen': '0.0.0.0'
        }
            # Note: always include trailing slash in directory definitions
            # Directory where files are temporarily stored for valdation
        self.tempdir = '/tmp/'
        self.templatedir = './'
        self.val_script = '../scripts/val_schema_stdout.sh'
        self.check_executable(self.val_script)

        self.profiles = {
            'PVP2 Schematron V0.1 (Verwaltungsportalverbund)': 'PVP2_V01',
            'saml2int.org V0.2': 'SAML2INT_V02',
        }

    def check_executable(self, fpath):
        if not os.path.isfile(fpath):
            raise Exception('Cannot find script ' + fpath)
        if not os.access(fpath, os.X_OK):
            raise Exception('Cannot execute script ' + fpath)


