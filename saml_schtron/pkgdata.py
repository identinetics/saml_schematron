import os, sys

'''
Method to access a resource from setup/package_data with its path, as opposed to pkgutil.get_data()

credits to http://stackoverflow.com/questions/5003755/how-to-use-pkgutils-get-data-with-csv-reader-in-python
'''

from pkgutil import get_loader

def get_path(package, resource):
    loader = get_loader(package)
    if loader is None or not hasattr(loader, 'get_data'):
        raise ValueError('could not get loader for package %s, or loader has no get_data()' % package)
    mod = sys.modules.get(package) or loader.load_module(package)
    if mod is None:
        raise ValueError('could not get module for package %s' % package)
    if not hasattr(mod, '__file__'):
        raise ValueError('module does not have __file__')

    # Modify the resource name to be compatible with the loader.get_data
    # signature - an os.path format "filename" starting with the dirname of
    # the package's __file__
    parts = resource.split('/')
    parts.insert(0, os.path.dirname(mod.__file__))
    resource_name = os.path.join(*parts)
    return resource_name