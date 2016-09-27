import logging, os
__author__ = 'r2h2'

class LoggingConfig:
    """
    create a logger with the filename passed to __init__ and set the output directory.
    Output directory is either env $LOGDIR or ./log/
    If console=True both file and console loggers are created, otherwise only file (daemon use)
    """
    def __init__(self,
                 module: str,
                 console=True,
                 console_level=logging.INFO,
                 file_level=logging.DEBUG,
                 mode='a'):
        logdir = os.environ.get('LOGDIR', os.path.abspath(os.path.join('log')))
        if not os.path.exists(logdir):
            os.makedirs(logdir)
        self.LOGFILENAME = os.path.abspath(os.path.join(logdir, module + '.debug'))
        if console:
            handlers_dict = {'handlers': ['file', 'console'], 'level': logging.DEBUG,}
        else:
            handlers_dict = {'handlers': ['file', ], 'level': logging.DEBUG,}
        LOGGING = dict(
            version = 1,
            formatters = {
                'long': {'format': '%(asctime)s - %(levelname)s  [%(filename)s:%(lineno)s] %(message)s'},
                'short': {'format': '%(levelname)-6s %(message)s'},
                },
            handlers = {
                'console': {
                      'class': 'logging.StreamHandler',
                      'formatter': 'short',
                      'level': console_level
                },
                'file': {
                      'class': 'logging.FileHandler',
                      'formatter': 'long',
                      'level': file_level,
                      'filename': self.LOGFILENAME,
                      'mode': mode,
                },
            },
            loggers = {'': handlers_dict},
            #loggers = {'': {'handlers': ['file', 'console'], 'level': logging.DEBUG,}},
        )

        logging.config.dictConfig(LOGGING)