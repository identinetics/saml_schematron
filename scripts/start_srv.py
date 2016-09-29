#!/usr/bin/env python

import os, sys
print('\n'.join(sys.path))
import saml_schtron.webapp.config
import saml_schtron.webapp.app_handler
import werkzeug.serving

# start server
def main():
    config = saml_schtron.webapp.config.Config()
    app_handler = saml_schtron.webapp.app_handler.AppHandler(config)
    werkzeug.serving.run_simple(config.HttpServer['listen'],
               config.HttpServer['port'],
               app_handler.application,
               static_files={'/static': os.path.join(os.path.dirname(__file__), '../saml_schtron/webapp/static'),
                             '/xmlschema': os.path.join(os.path.dirname(__file__), '../xmlschema')},
               use_debugger=True)


if __name__ == '__main__':
    main()