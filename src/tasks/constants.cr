require "./utils/system_information/helm.cr"
require "./utils/embedded_file_manager.cr"

CNF_DIR = "cnfs"
CONFIG_FILE = "cnf-conformance.yml"
TOOLS_DIR = "tools"
BASE_CONFIG = "./config.yml"
POINTSFILE = "points.yml"
PASSED = "passed"
FAILED = "failed"
SKIPPED = "skipped"
DEFAULT_POINTSFILENAME = "points_v1.yml"
PRIVILEGED_WHITELIST_CONTAINERS = ["chaos-daemon"]
IGNORED_SECRET_TYPES = ["kubernetes.io/service-account-token", "kubernetes.io/dockercfg", "kubernetes.io/dockerconfigjson", "helm.sh/release.v1"]

#Embedded global text variables
EmbeddedFileManager.node_failure_values
EmbeddedFileManager.cri_tools
EmbeddedFileManager.reboot_daemon
EmbeddedFileManager.chaos_network_loss
EmbeddedFileManager.chaos_cpu_hog
EmbeddedFileManager.chaos_container_kill

CNFSingleton = CNFGlobals.new
class CNFGlobals
  CNF_DIR = "cnfs"
  @helm: String?
  # Get helm directory
  def helm
    @helm ||= global_helm_installed? ? "helm" : Helm.local_helm_path
  end
end


