import difflib, logging, os.path
__author__ = 'r2h2'

def assertNoDiff(fname1, fname2=None):
    ''' compare contents of file 1 with file 2
    If reference is not given it is defaulted to same name in ../testdata/
    raise assert message if file contents are not equal
    '''
    if fname2 is None:
        fname2 = os.path.join(os.path.dirname(os.path.dirname(fname1)), 'testdata', os.path.basename(fname1))
    fd1 = open(fname1)
    fd2 = open(fname2)
    diff = difflib.unified_diff(fd1.readlines(), fd2.readlines())
    fd1.close()
    fd2.close()
    try:
        assert ''.join(diff) == '', 'result (' + fname1 + ') is not equal to reference data'
    except AssertionError as e:
        logging.error('     result (' + fname1 + ')is not equal to reference data.')
        logging.debug(e)
        raise

