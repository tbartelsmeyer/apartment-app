$LOAD_PATH.unshift '.'
require 'config/environment'

use ApartmentsController
use TenantsController
run ApplicationController
