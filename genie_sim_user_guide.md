# [Genie Sim Benchmark](#/v3)

- [Genie Sim 3.0 User Guide](#/v3?id=genie-sim-30-user-guide)
    - [1. Overview](#/v3?id=_1-overview)
    - [2. Quick Start](#/v3?id=_2-quick-start)
        - [2.1 Requirements](#/v3?id=_21-requirements)
        - [2.2 Download](#/v3?id=_22-download)
        - [2.3 Installation](#/v3?id=_23-installation)
            - [2.3.1 Docker Container (recommended)](#/v3?id=_231-docker-container-recommended)
            - [2.3.2 (optional) Use Genie Sim as Python Module](#/v3?id=_232-optional-use-genie-sim-as-python-module)
            - [2.3.3 Host Machine](#/v3?id=_233-host-machine)
            - [2.3.4 Developer Guide](#/v3?id=_234-developer-guide)
                - [2.3.4.1 Enable](#/v3?id=_2341-enable-pre-commit-hooks-for-collaboration-optional) [`pre-commit`](#/v3?id=_2341-enable-pre-commit-hooks-for-collaboration-optional) [hooks for collaboration (optional)](#/v3?id=_2341-enable-pre-commit-hooks-for-collaboration-optional)
    - [3. Tutorials](#/v3?id=_3-tutorials)
        - [3.1 Benchmark Evaluation](#/v3?id=_31-benchmark-evaluation)
            - [3.1.1 Task Overview](#/v3?id=_311-task-overview)
            - [3.1.2 Run a Simulation Task](#/v3?id=_312-run-a-simulation-task)
            - [3.1.3 Run Inference + Simulation](#/v3?id=_313-run-inference-simulation)
            - [3.1.4 VLM Auto Evaluation](#/v3?id=_314-vlm-auto-evaluation)
            - [3.1.5 Batch Run Task Suite](#/v3?id=_315-batch-run-task-suite)
            - [3.1.6 Utility Scripts](#/v3?id=_316-utility-scripts)
            - [3.1.7 Model Training](#/v3?id=_317-model-training)
        - [3.2 Scene Generator](#/v3?id=_32-scene-generator)
            - [3.2.1 Features](#/v3?id=_321-features)
            - [3.2.2 Deploy](#/v3?id=_322-deploy)
            - [3.2.3 Start Scene Generation](#/v3?id=_323-start-scene-generation)
            - [3.2.4 Mass-scale scene layout generalization](#/v3?id=_324-mass-scale-scene-layout-generalization)
        - [3.3 Synthetic Data Collection](#/v3?id=_33-synthetic-data-collection)
            - [3.3.1 Teleoperation](#/v3?id=_331-teleoperation)
                - [3.3.1.1 Pico Setup](#/v3?id=_3311-pico-setup)
                - [3.3.1.2 Launch Setup](#/v3?id=_3312-launch-setup)
            - [3.3.2 Automated Collection](#/v3?id=_332-automated-collection)
                - [3.3.2.1 Installation](#/v3?id=_3321-installation)
                - [3.3.2.2 Data Collection](#/v3?id=_3322-data-collection)
        - [3.4 Scene Reconstruction](#/v3?id=_34-scene-reconstruction)
            - [3.4.1 Data Introduction](#/v3?id=_341-data-introduction)
            - [3.4.2 Environment Installation](#/v3?id=_342-environment-installation)
            - [3.4.3 Run Scene Reconstruction](#/v3?id=_343-run-scene-reconstruction)
        - [3.5 AgiBot World Challenge Reasoning to Action Tasks (ICRA)](#/v3?id=_35-agibot-world-challenge-reasoning-to-action-tasks-icra)
            - [3.5.1 Run Baseline Model Inference](#/v3?id=_351-run-baseline-model-inference)
            - [3.5.2 Run ICRA tasks](#/v3?id=_352-run-icra-tasks)
            - [3.5.3 Integrate Your Own Policy](#/v3?id=_353-integrate-your-own-policy)
            - [3.5.4 Submit Your Policy](#/v3?id=_354-submit-your-policy)
        - [3.6 Reinforcement Learning with RLinf](#/v3?id=_36-reinforcement-learning-with-rlinf)
            - [3.6.1 Repository Setup](#/v3?id=_361-repository-setup)
            - [3.6.2 Docker Image Build](#/v3?id=_362-docker-image-build)
            - [3.6.3 SpaceMouse Setup](#/v3?id=_363-spacemouse-setup)
            - [3.6.4 Download Pretrained Weights](#/v3?id=_364-download-pretrained-weights)
            - [3.6.5 Collect Demonstration Data](#/v3?id=_365-collect-demonstration-data)
            - [3.6.6 Convert Demonstration Data](#/v3?id=_366-convert-demonstration-data)
            - [3.6.7 Start Training](#/v3?id=_367-start-training)
            - [3.6.8 Monitoring and Debugging](#/v3?id=_368-monitoring-and-debugging)
            - [3.6.9 Command Reference](#/v3?id=_369-command-reference)
            - [3.6.10 Key Configuration Files](#/v3?id=_3610-key-configuration-files)
            - [3.6.11 Troubleshooting](#/v3?id=_3611-troubleshooting)

# [Genie Sim 3.0 User Guide](#/v3?id=genie-sim-30-user-guide)

## [1. Overview](#/v3?id=_1-overview)

Genie Sim is the simulation platform from AgiBot. It provides developers with a complete toolchain for digital asset generation, scene generalization, data collection, and automated evaluation. Its core module, Genie Sim Benchmark is a standardized tool dedicated to establishing the most accurate and authoritative evaluation for embodied intelligence.

The platform integrates 3D reconstruction with visual generation to create a high-fidelity simulation environment. It pioneers LLM-driven technology to generate vast simulation scenes and evaluation metrics in minutes. The evaluation system covers 200+ tasks across 100,000+ scenarios to build a comprehensive capability profile for models. Genie Sim also opens over 10,000 hours simulation dataset including real-world robot operation scenarios.

The platform will significantly accelerate model development, reduce reliance on physical hardware, and empower innovation in embodied intelligence. Simulation assets, data, and code are fully open source.

## [2. Quick Start](#/v3?id=_2-quick-start)

### [2.1 Requirements](#/v3?id=_21-requirements)

| Minimum                                                                                                                                                                                                   | Tested                                                                                                                                                                                                  |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| - Ubuntu 22.04/24.04 - NVIDIA Isaac Sim 5.1.0 - Hardware     - CPU: Inter Core i7(7th Generation) AMD Ryzen 5     - RAM: 32GB     - GPU: GeForce RTX 4080     - Driver: 580.65.06     - Storage: 50GB SSD | - Ubuntu 22.04 - NVIDIA Isaac Sim 5.1.0 - Hardware     - CPU: Inter Core i7(12th Generation)     - RAM: 64GB     - GPU: GeForce RTX 4090D     - Driver: 550.120 + CUDA 12.4     - Storage: 1TB NVMe SSD |

[https://docs.isaacsim.omniverse.nvidia.com/latest/installation/requirements.html](https://docs.isaacsim.omniverse.nvidia.com/latest/installation/requirements.html)

### [2.2 Download](#/v3?id=_22-download)

- Genie Sim `git clone https://github.com/AgibotTech/genie_sim.git` Copy to clipboard Error Copied
- Genie Sim Assets Download Genie Sim Assets and put them into `genie_sim/source/geniesim/assets` : `# ModelScope git clone https://www.modelscope.cn/datasets/agibot_world/GenieSimAssets.git --branch rolling genie_sim/source/geniesim/assets # Hugging Face git clone https://huggingface.co/datasets/agibot-world/GenieSimAssets --branch rolling genie_sim/source/geniesim/assets` Copy to clipboard Error Copied **NOTE: Please use the** **`rolling`** **branch to get the latest assets.**

### [2.3 Installation](#/v3?id=_23-installation)

#### [2.3.1 Docker Container (recommended)](#/v3?id=_231-docker-container-recommended)

1. Prepare docker image

NOTE：Genie Sim Benchmark dropped support for curobo since 3.0

`# create docker image from dockerfile
cd genie_sim
genie_sim$ docker build -f ./scripts/dockerfile -t registry.agibot.com/genie-sim/open_source:latest .` `Copy to clipboard Error Copied`

1. Launch docker container and run the demo Make sure GenieSimAssets is downloaded at genie\_sim/source/geniesim/assets

`# start a new container in repo root
cd genie_sim
genie_sim$ ./scripts/start_gui.sh # open a new terminal, into container genie_sim$ ./scripts/into.sh # inside container, run the demo /geniesim/main$ geniesim --config source/geniesim/config/s2r_select_color.yaml` `Copy to clipboard Error Copied`

#### [2.3.2 (optional) Use Genie Sim as Python Module](#/v3?id=_232-optional-use-genie-sim-as-python-module)

NOTE：This is for `import geniesim` from other workspace, `geniesim` is tested only in conda python3.11

`# prepare conda env cd genie_sim
genie_sim$ conda create - - name geniesim python = 3.11
# cd in genie_sim root dir genie_sim$ conda activate genniesim
genie_sim$ python - m pip install - e . / source` `Copy to clipboard Error Copied`

#### [2.3.3 Host Machine](#/v3?id=_233-host-machine)

1. We **STRONGLY** recommend developers using our tested docker container environment for development

#### [2.3.4 Developer Guide](#/v3?id=_234-developer-guide)

##### [2.3.4.1 Enable pre-commit hooks for collaboration (optional)](#/v3?id=_2341-enable-pre-commit-hooks-for-collaboration-optional)

NOTE: Make sure dependencies in requirements.txt are properly installed, the pre-commit hook will be triggered once git commit is involved.

1. Install and setup `pre-commit` to enable auto file-formatter, python / json / yaml etc.

`# install pre-commit to your python env genie_sim$ pip install pre-commit # enable pre-defined pre-commit-hooks within repo genie_sim$ pre-commit install` `Copy to clipboard Error Copied`

1. Trigger file-formatter for all tracked files

`genie_sim$ pre-commit run --all-files` `Copy to clipboard Error Copied`

## [3. Tutorials](#/v3?id=_3-tutorials)

### [3.1 Benchmark Evaluation](#/v3?id=_31-benchmark-evaluation)

GenieSim Benchmark provides a standardized evaluation pipeline for robot manipulation policies. The benchmark supports four task categories and automates the entire process from simulation execution to score aggregation.

#### [3.1.1 Task Overview](#/v3?id=_311-task-overview)

GenieSim Benchmark organizes evaluation tasks into four categories. Each task is defined by a YAML config file under `source/geniesim/config/` , named with a category prefix.

| Type     | Prefix          | Description                                                                                                 | Example Tasks                                                                 |
|----------|-----------------|-------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| `if`     | `if_*.yaml`     | Instruction Following - pick/place guided by language instructions                                          | pick_block_color, pick_block_shape, pick_object_type, straighten_object, etc. |
| `robust` | `robust_*.yaml` | Robustness - evaluate generalization under perturbations (camera noise, lighting, material, joint PD, etc.) | robust_pick_block_color_lightgen, robust_pick_block_color_camoccgen, etc.     |
| `manip`  | `manip_*.yaml`  | Manipulation - complex manipulation tasks (pour, scoop, open door, bimanual)                                | manip_open_door, manip_pour_workpiece, manip_bimanual_hold_pot, etc.          |
| `s2r`    | `s2r_*.yaml`    | Sim-to-Real - tasks designed to test sim-to-real transfer                                                   | s2r_stack_blocks, s2r_select_color, s2r_sort_fruit, etc.                      |

A typical task config looks like:

`app:
  enable_rate_limit: true
  enable_ros: false
benchmark:
  task_name: table_task_1_g2
  sub_task_name: pick_block_color
  seed: 1
  model_arc: pi
  num_episode: 1
  record: false` `Copy to clipboard Error Copied`

Key parameters:

| Parameter           | Section   | Description                                           |
|---------------------|-----------|-------------------------------------------------------|
| `enable_rate_limit` | app       | Enable simulation rate limiting for stable execution  |
| `enable_ros`        | app       | Enable ROS2 communication (required for recording)    |
| `task_name`         | benchmark | Background scene/environment name                     |
| `sub_task_name`     | benchmark | Specific task name                                    |
| `seed`              | benchmark | Random seed for reproducibility                       |
| `model_arc`         | benchmark | Policy model architecture (e.g., `pi` )               |
| `num_episode`       | benchmark | Number of evaluation episodes                         |
| `infer_host`        | benchmark | Inference server address (default: `localhost:8999` ) |
| `record`            | benchmark | Enable rosbag recording                               |
| `preview`           | benchmark | Enable debug preview images                           |

Any parameter in the YAML config can be overridden via CLI with `--section.key value` syntax.

#### [3.1.2 Run a Simulation Task](#/v3?id=_312-run-a-simulation-task)

This section demonstrates how to launch a single benchmark simulation task, using `s2r_select_color` as an example.

Start the simulation container with GUI:

`genie_sim$ ./scripts/start_gui.sh` `Copy to clipboard Error Copied`

Enter the container:

`genie_sim$ ./scripts/into.sh` `Copy to clipboard Error Copied`

Run the simulation task:

`/geniesim/main$ geniesim --config source/geniesim/config/s2r_select_color.yaml` `Copy to clipboard Error Copied`

You can override config parameters via CLI. For example, to run task preview:

`/geniesim/main$ geniesim \ --config source/geniesim/config/s2r_select_color.yaml \ --benchmark.preview true` `Copy to clipboard Error Copied`

#### [3.1.3 Run Inference + Simulation](#/v3?id=_313-run-inference-simulation)

This section walks through running a full inference-driven simulation task end-to-end. It requires two separate Docker containers: one for the policy inference server and one for the simulation.

**Step 1: Setup inference code**

`genie_sim$ ./scripts/infer_setup.sh` `Copy to clipboard Error Copied`

**Step 2: Download checkpoints**

Demo task checkpoints are available on ModelScope: [https://modelscope.cn/datasets/agibot\_world/GenieSim3.0-Dataset/tree/master/checkpoints](https://modelscope.cn/datasets/agibot_world/GenieSim3.0-Dataset/tree/master/checkpoints)

| Checkpoint Path     | Task Config             | Checkpoint Path       | Task Config                 |
|---------------------|-------------------------|-----------------------|-----------------------------|
| select_color        | s2r_select_color        | recognize_size        | s2r_size_recognize          |
| grasp_targets       | s2r_grasp_targets       | organize_items        | s2r_organize_items          |
| sort_fruit          | s2r_sort_fruit          | handover_chips        | s2r_bimanual_chip_handover  |
| pack_in_supermarket | s2r_pack_in_supermarket | place_block_in_drawer | s2r_place_block_into_drawer |

After running `infer_setup.sh` , use the provided script to download checkpoints:

`# Download default checkpoint (select_color) genie_sim$ ./scripts/download_checkpoint.sh # Download a specific task checkpoint genie_sim$ ./scripts/download_checkpoint.sh select_color
genie_sim$ ./scripts/download_checkpoint.sh grasp_targets` `Copy to clipboard Error Copied`

**Step 3: Docker setup for inference**

a. Pull the base docker image

`docker pull nvcr.io/nvidia/cuda@sha256:2d913b09e6be8387e1a10976933642c73c840c0b735f0bf3c28d97fc9bc422e0` `Copy to clipboard Error Copied`

b. Build the docker image for openpi

`genie_sim$ cd openpi
genie_sim/openpi$ docker compose -f scripts/docker/compose.yml up --build` `Copy to clipboard Error Copied`

Reference: [https://github.com/Physical-Intelligence/openpi/blob/main/docs/docker.md](https://github.com/Physical-Intelligence/openpi/blob/main/docs/docker.md)

c. Create docker container and start inference

`genie_sim/openpi$ ./scripts/docker/run_infer.sh` `Copy to clipboard Error Copied`

**Step 4: Start inference service**

The inference service is deployed on localhost by default. You can also start a service on other machines and set the corresponding IP and port in benchmark configuration files for distributed communication.

`geniesim # bash scripts/server.sh 0 8999 S2R_SELECT_COLOR` `Copy to clipboard Error Copied`

**Step 5: Start simulation container and run the task**

In another terminal, start the simulation container and execute the task:

`genie_sim$ ./scripts/start_gui.sh
genie_sim$ ./scripts/into.sh

/geniesim/main$ geniesim --config source/geniesim/config/s2r_select_color.yaml` `Copy to clipboard Error Copied`

To point the simulation to a remote inference server, override the `infer_host` parameter:

`/geniesim/main$ geniesim --config source/geniesim/config/s2r_select_color.yaml \ --benchmark.infer_host ip:port` `Copy to clipboard Error Copied`

#### [3.1.4 VLM Auto Evaluation](#/v3?id=_314-vlm-auto-evaluation)

GenieSim Benchmark integrates a VLM-based automatic evaluation system. During benchmark execution, the VLM evaluator captures robot camera images at key steps and uses a vision-language model to score task completion automatically.

**Configuration**

The LLM/VLM configuration is stored at `source/geniesim/evaluator/config/llm_config.yaml` :

`llm:
  api_key: ""
  base_url: "https://dashscope.aliyuncs.com/compatible-mode/v1"
  model: "qwen3-max"

vlm:
  api_key: ""
  base_url: "https://dashscope.aliyuncs.com/compatible-mode/v1"
  model: "qwen3-vl-plus"` `Copy to clipboard Error Copied`

You can also override these settings via environment variables. Export the following environment variables in the container before running benchmark tasks:

| Var Name   | Default Setting                                                                                        | Usage                     | Necessity   |
|------------|--------------------------------------------------------------------------------------------------------|---------------------------|-------------|
| BASE_URL   | [https://dashscope.aliyuncs.com/compatible-mode/v1](https://dashscope.aliyuncs.com/compatible-mode/v1) | API endpoint              | Required    |
| API_KEY    | Your Api Key                                                                                           | API authentication        | Required    |
| MODEL      | qwen3-max                                                                                              | for evaluation generation | Optional    |
| VL_MODEL   | qwen3-vl-plus                                                                                          | for VLM auto score        | Required    |

Environment variables take priority over the YAML config file. If no environment variable is set, the values in `llm_config.yaml` are used.

#### [3.1.5 Batch Run Task Suite](#/v3?id=_315-batch-run-task-suite)

This section describes how to run all tasks of a given category in batch. **Before running batch tasks, make sure the inference service is already started** (see [3.1.3](#/v3?id=313-run-inference--simulation) ).

**Prerequisites**

Start the simulation container (headless mode is recommended for batch runs):

`genie_sim$ ./scripts/start_gui.sh` `Copy to clipboard Error Copied`

**Run a full task category**

Use `run_batch_tasks.sh` to run all tasks of a given category:

`# Basic usage (required: --type) /geniesim/main$ ./scripts/run_batch_tasks.sh --type if
# With custom inference host /geniesim/main$ ./scripts/run_batch_tasks.sh --type s2r --infer-host ip:port # With multiple episodes /geniesim/main$ ./scripts/run_batch_tasks.sh --type manip --num-episode 5
# With preview mode (saves debug preview images) /geniesim/main$ ./scripts/run_batch_tasks.sh --type robust --preview --preview_out /path/to/output # Full example /geniesim/main$ ./scripts/run_batch_tasks.sh --type if --infer-host ip:port --num-episode 10 --preview` `Copy to clipboard Error Copied`

Arguments:

| Argument                 | Required   | Description                                                               |
|--------------------------|------------|---------------------------------------------------------------------------|
| `--type TYPE`            | Yes        | Task category: `if` , `robust` , `manip` , or `s2r`                       |
| `--infer-host HOST:PORT` | No         | Override the policy inference server address (default: `localhost:8999` ) |
| `--num-episode N`        | No         | Number of episodes per task (default: 1)                                  |
| `--preview`              | No         | Enable preview mode (saves debug images)                                  |
| `--preview_out PATH`     | No         | Custom output directory for preview images                                |

**Output structure**

Benchmark results are saved under `output/benchmark/` :

`output/benchmark/
├── pick_block_color/
│   ├── episode_0/
│   │   └── result.json
│   ├── episode_1/
│   │   └── result.json
│   └── statistics.json
├── pick_block_shape/
│   └── ...
└── ...` `Copy to clipboard Error Copied`

After all tasks complete, `run_batch_tasks.sh` automatically runs `stat_average.py` to compute and display the overall average score. If a previous benchmark output exists, it is automatically backed up to `output/benchmark_{YYYY-MM-DD-HH}/` before starting a new run.

#### [3.1.6 Utility Scripts](#/v3?id=_316-utility-scripts)

**Cleanup**

If a run is interrupted or processes are left behind, use the cleanup script to kill any residual simulation, ROS2, and Carbonite processes:

`/geniesim/main$ ./scripts/clean.sh` `Copy to clipboard Error Copied`

**Record Simulation Data**

To enable video recording of benchmark episodes:

1. Set `enable_ros: true` in the `app` section of the task YAML config
2. Set `record: true` in the `benchmark` section
3. Start the auto-recorder in a separate terminal inside the container:

`/geniesim/main$ ./scripts/start_auto_record.sh` `Copy to clipboard Error Copied`

Optional arguments:

| Argument                 | Description                                                           |
|--------------------------|-----------------------------------------------------------------------|
| `--final_output_dir DIR` | Custom final output directory                                         |
| `--resize_width WIDTH`   | Resize image width                                                    |
| `--resize_height HEIGHT` | Resize image height                                                   |
| `--image_timeout SEC`    | Auto stop recording after N seconds with no new image (default: 30.0) |

The recording process auto exits after simulation is finished. Press `Ctrl+C` to stop gracefully and convert videos. Recorded data (rosbag + extracted videos) will be saved at `./output/recording_data/` .

**Collect Scores**

Compute the average score across all benchmark tasks:

`/geniesim/main$ python3 scripts/stat_average.py output/benchmark` `Copy to clipboard Error Copied`

#### [3.1.7 Model Training](#/v3?id=_317-model-training)

1. Download training data

Training datasets are available on ModelScope: [https://modelscope.cn/datasets/agibot\_world/GenieSim3.0-Dataset/tree/master/task\_suite](https://modelscope.cn/datasets/agibot_world/GenieSim3.0-Dataset/tree/master/task_suite)

Use the provided script to download task suite data:

`# Download all task suites genie_sim$ ./scripts/download_dataset.sh # Download a specific task suite genie_sim$ ./scripts/download_dataset.sh instruction
genie_sim$ ./scripts/download_dataset.sh manipulation
genie_sim$ ./scripts/download_dataset.sh sim2real # Download to a custom directory genie_sim$ ./scripts/download_dataset.sh sim2real /path/to/save` `Copy to clipboard Error Copied`

2. Model Training &amp; Inference

GenieSim Benchmark supports multiple model architectures for training and inference:

| Model       | Reference                                                                                                           |
|-------------|---------------------------------------------------------------------------------------------------------------------|
| GR00T       | [Isaac-GR00T User Guide](https://github.com/MiaoMieu/Isaac-GR00T/blob/main/scripts/preprocess_agibot/USER_GUIDE.md) |
| ACoT-VLA    | [ACoT-VLA](https://github.com/AgibotTech/ACoT-VLA)                                                                  |
| Pi0 / Pi0.5 | [OpenPI](https://github.com/Anonymous-694/ACoT-VLA)                                                                 |

### [3.2 Scene Generator](#/v3?id=_32-scene-generator)

`Scene Generator` is an **LLM-driven** pipeline which takes in the natural language from the user, then performs ***RAG retrieval*** from `geniesim.assets` module and python coding for **scene\_graph** , finally returns the "scene language".

#### [3.2.1 Features](#/v3?id=_321-features)

1. **Promptable** - Chat within one window with continuous context.
2. **Scene Graph** - Structural scene graph and text annotation, LLM-friendly, benchmark-task-friendly.
3. **Controllable Edit** - High precision in spatial space, and code-level controllability
4. **Generalization** - Semantic, spatial joint generalization through many aspects
5. **Customize** - RAG enhanced LLM is training free and supports user's own LLM
6. **GenieSim Ready** - The output scene\_graph and scene layout assets are integrated seamlessly in to `geniesim.benchmark`

#### [3.2.2 Deploy](#/v3?id=_322-deploy)

- The generator module is located at `{GENIESIM_REPO}/source/geniesim/generator`
- You **MUST** prepare your own `OPENAI_API_BASE_URL` and `OPENAI_API_KEY` before running the generator pipeline

1. Below are the popular models we tested. Model Provider Model Name ChatGPT `gpt-5` Gemini `gemini-pro-latest` DeepSeek `deepseek-chat/deepseek-reasoner` QWEN `qwen3-max` Different models may have big differences in the output, and they're all input sensitive. Models with think mode or reasoner model may think longer and consume more tokens, this depends on how complex the scenario is. For text embedding model for asset searching, we recommend **QWEN:text-embedding-v4 with 2048 dimensions** .
2. Launch generator pipeline with following command.
    1. Configure the embedding model. Choose either text embedding model (recommend **QWEN:text-embedding-v4** ) through **API** or VL embedding model by local deployment.
        - **Text embedding.** Configure `{GENIESIM_REPO}/source/geniesim/generator/server/mcp_text_embedding/text_embedding_config.json` with your **api key** and **base-url** of your embedding model.
        - **VL embedding (local GPU is required).**
            1. Download VL embedding model. We use [Qwen3-VL-Embedding](https://github.com/QwenLM/Qwen3-VL-Embedding) . You can download the models using the script below or manually download Qwen3-VL-Embedding Model and Qwen3-VL-Reranker Model together with their corresponding scripts ( [Qwen3-VL-Embedding](https://raw.githubusercontent.com/QwenLM/Qwen3-VL-Embedding/main/src/models/qwen3_vl_embedding.py) and [Qwen3-VL-Reranker](https://raw.githubusercontent.com/QwenLM/Qwen3-VL-Embedding/main/src/models/qwen3_vl_reranker.py) ) and put them into `source/geniesim/generator/server/assets_searcher/models` . `cd { GENIESIM_REPO } /source/geniesim/generator/server/assets_searcher bash download_models.sh # Downloads model and scripts; see download_model.sh for details` Copy to clipboard Error Copied
            2. Prepare assets visualization. In a Python environment with **Isaac-Sim** , run Python scripts in the assets folder. `cd { ASSETS_DIR } python tools/generate_recorder_usda.py python tools/generate_object_snapshots_and_video.py` Copy to clipboard Error Copied Then, snapshots and videos will be generated at `{ASSETS_DIR}/extra/visualization/` .
            3. (Optional) Configuration. Adjust `BATCH_SIZE` and `USE_RERANKER` under `services/mcp-server_vl/environment` in `source/geniesim/generator/compose.yaml` according to your hardware:
    2. Launch generator `# in Genie Sim repo root directory cd genie_sim # for text embedding ./scripts/start_generator.sh # for local VL embedding ./scripts/start_generator.sh --vl_embedding` Copy to clipboard Error Copied
    <!-- image -->
    <!-- image -->
    <!-- image -->
<!-- image -->
<!-- image -->
<!-- image -->

3. Setting up the geniesim webui configs, by following orders
    1. First MAKE SURE add your **OPENAI\_API\_BASE\_URL** and **OPENAI\_API\_KEY** to *generator/config/openwebui.json* .
    2. Go to "Admin Panel(bottom left corner)" -&gt; "setting" -&gt; "database" Or visit [http://localhost:8080/admin/settings/db](http://localhost:8080/admin/settings/db)
        1. Click " *Import Config from JSON File* "
        2. Import *geniesim/generator/config/openwebui.json*
    3. Go to "Admin Panel(bottom left corner)" -&gt; "Functions" Or visit [http://localhost:8080/admin/functions](http://localhost:8080/admin/functions)
        1. Click *Import* (top right)
        2. Import *geniesim/generator/config/function-save\_code\_to\_file.json* and refresh with F5
        3. Enable the imported function and set it **global**
    4. Go to "workspace" -&gt; "models" Or visit [http://localhost:8080/admin/functions](http://localhost:8080/admin/functions)
        1. Click *"Import"*
        2. Import *geniesim/generator/config/geniesimassets.json*
        3. Import *geniesim/generator/config/geniesimscenegen.json*
    5. Edit the imported models to use your own LLM
        1. Click the *"..."* for more options on the right side of each model, select *"edit"*
        2. In the Base Model (From) section, select the LLM you wish to use
        3. Go to the page bottom, click *Save &amp; Update* , done

4. (Optional) Customizations a. If you wish to customize API Connection in Open WebUI Once Open WebUI is running: Use this for  **OpenAI** ,  **DeepSeek** ,  **OpenRouter** ,  **LocalAI** ,  **FastChat** ,  **Helicone** ,  **LiteLLM** , etc.
5. **LICENSE: ** [**open-webui**](https://github.com/open-webui/open-webui) ** is open-sourced at github under multiple licenses. For complete and updated licensing details, please see the** [**LICENSE**](https://github.com/open-webui/open-webui/blob/main/LICENSE) ** files.**

#### [3.2.3 Start Scene Generation](#/v3?id=_323-start-scene-generation)

1. Check the assets retrieval results, before starting scene generation a. By continuing chatting with "GenieSim Assistant", you can edit the retrieval results b. Once confirmed, switch to "GenieSim Generator" c. Say " *generate the scene* " to start generation
<!-- image -->
<!-- image -->
4. Scene generation usually takes time depending on LLM and scene complexity a. The context is maintained within the same chat window. You can make adjustments via dialogue, and be aware of the context limit of your model b. Finally, save the results to `geniesim/generator/LLM_RESULT.py` by clicking the blue icon * **(Save Codes to File)***  shown above, then a green bubble will show up indicating usda file is saved successfully
<!-- image -->
<!-- image -->
7. Run generator to assemble the `scene_graph` and `scene usd assets` . a. The generator assembler uses the local built version of docker image `registry.agibot.com/genie-sim/open_source:latest` , make sure you've run through the installation section b. We provide a real-time viewer, which can automatically generate and load the usda file if `geniesim/generator/LLM_RESULT.py` changes. Run following commands to start viewer: `# start the container cd genie_sim genie_sim$ ./scripts/start_gui.sh # run auto generator inside docker isaac-sim@user:/geniesim/main$ omni_python source/geniesim/generator/scene_viewer.py # The output folder path is shown in the log` Copy to clipboard Error Copied Trigger once via commandline, run `isaac-sim@user:/geniesim/main$ ./scripts/run_generator.sh` c. During editing, click the *Save Codes to File* button to trigger the result preview, and the scene will be generated and loaded into IsaacSim.
<!-- image -->
<!-- image -->

#### [3.2.4 Mass-scale scene layout generalization](#/v3?id=_324-mass-scale-scene-layout-generalization)

1. Here's the instruction to enable support for massive joint generalization a. First explicitly define the generalization rules, and be specific about the details b. Use structural `Markdown` format and carefully edit the prompt, lower the temperature of your model if *necessary* c. If you wish to generate a scene with the assets list you provide, you can directly start the chat window with "GenieSim Generator" to skip the assets retrieval part d. The underlying randomness uses random seeds to calculate random numbers. If your program fails to generate different scenes after each run, please check the system random interface
2. Prompt Demo 1, *provide object list and rules of randomization*

I'd like to create a simple scene using **"table\_000"** with the following specifications:

- Randomly select **two distinct objects** from my list.
- Place them  **near the center of the table** , slightly closer to the operator for easy access.
- Add a small amount of **random yaw rotation** (e.g., uniformly distributed between 0° and 360°) to each object to give the arrangement a more natural, less staged appearance.
- Ensure the two objects  **do not intersect or collide** -maintain clear separation between them.

The object list is: `["apple", "blocks", "cola", "facecleaner", "sprite"]`

1. Prompt Demo2, *provide object list with natural language instructions*

I'd like to create a simple scene using "table\_000" with the following setup:

- Randomly select one drink can from my object list.
- Build a champagne tower using multiple copies of the chosen drink can.
- Place a single apple on top of the tower.
- Ensure all objects are neatly arranged on the tabletop.

The available object list is: `["apple", "blocks", "cola", "facecleaner", "sprite"]`

1. Prompt Demo3, *provide object list and layout parameters*

I'd like to create a simple scene using "table\_000" with the following setup:

- Randomly select 9 items from my object list.
- Arrange the selected objects in a 3×3 grid on the table, with each grid cell measuring 20 cm per side.
- Apply a small amount of random variation to each object's position: ±2 cm (normally distributed) along both the X and Y axes.
- Also randomize each object's orientation by applying a uniformly distributed yaw rotation between 0° and 360°.

The object list consists of: `["benchmark_building_blocks_001", "benchmark_building_blocks_002", ..., "benchmark_building_blocks_026"]` (i.e., items numbered from 1 to 30).

1. If anything in the output goes unexpected, chat like normal to tell LLM to fix it
2. For massive generalization, execute the generated results multiple times. Each generated scene will be available at output path with index and random seed

### [3.3 Synthetic Data Collection](#/v3?id=_33-synthetic-data-collection)

#### [3.3.1 Teleoperation](#/v3?id=_331-teleoperation)

Support joystick control for robot waist, left/right end effector and base movement

pico

<!-- image -->

| **No.**   | ** Function**                  |
|-----------|--------------------------------|
| **1**     | move base of the robot         |
| **2**     | control left gripper           |
| **3**     | backtracking action            |
| **4**     | reset left arm and right arm   |
| **5**     | enable left arm pose tracking  |
| **6**     | start recording                |
| **7**     | control the waist of the robot |
| **8**     | control right gripper          |
| **9**     | reset body and head            |
| **10**    | enable right arm pose tracking |

##### [3.3.1.1 Pico Setup](#/v3?id=_3311-pico-setup)

1. Connect to the same **LAN** as the computer
2. Start **AIDEA Vision App** in resource library
3. Choose **Wireless Connection** and enter the **IP** of the computer

**Note** : The AIDEA Vision App has been uploaded; you can access it here: [https://modelscope.cn/datasets/agibot\_world/GenieSim3.0-Dataset/tree/master/app](https://modelscope.cn/datasets/agibot_world/GenieSim3.0-Dataset/tree/master/app) . APK installation for the Pico Enterprise Edition HMD can be performed via a computer. When the HMD is connected via USB, its internal storage becomes accessible as a standard drive on the computer. The APK file can then be installed by copying it directly to this drive.

##### [3.3.1.2 Launch Setup](#/v3?id=_3312-launch-setup)

1. **Data Collection**

Execute the following command under genie\_sim root directory outside the docker container

`genie_sim$ ./scripts/autoteleop.sh` `Copy to clipboard Error Copied`

If you want to change tasks, please modify the `task_name` and `sub_task_name` fields in `./source/geniesim/config/teleop.yaml` .

1. **Data Post Process**

Execute the following command under genie\_sim root directory outside the docker container

`genie_sim$ ./scripts/autoteleop_post_process.sh {TASK_NAME}
#for example
genie_sim$ ./scripts/autoteleop_post_process.sh open_door` `Copy to clipboard Error Copied`

**Note: ** To improve collection efficiency, data collection and data post-processing can be run in parallel.

#### [3.3.2 Automated Collection](#/v3?id=_332-automated-collection)

##### [3.3.2.1 Installation](#/v3?id=_3321-installation)

Make sure the `SIM_ASSETS` environment variable is set properly to the Genie Sim Assets path, and then enter data\_collection directory:

`export SIM_ASSETS=YOUR_PATH_TO_ASSETS （e.g. ~/genie_sim/source/geniesim/assets）
cd genie_sim/source/data_collection
genie_sim/source/data_collection$ sudo chmod -R +x ./scripts` `Copy to clipboard Error Copied`

**Docker installation **

**Make sure the image in ** [**2.3.1**](#/v3?id=_231-docker-container-recommended) ** is built** , and run the following code to build the data collection image.

`genie_sim/source/data_collection$ docker build -f ./dockerfile -t registry.agibot.com/genie-sim/open_source-data-collection:latest .` `Copy to clipboard Error Copied`

**Note:** For cuRobo installation, the dockerfile is configured for **RTX 4090D ** by default. If you're using a different GPU model, you need to modify the `TORCH_CUDA_ARCH_LIST` environment variable in the dockerfile, 50 series GPU (SM\_120) may **NOT** be able to install or run cuRobo, this needs a compatibility update by the [cuRobo](https://github.com/NVlabs/curobo) team.

##### [3.3.2.2 Data Collection](#/v3?id=_3322-data-collection)

1. **One-Click Data Collection (Recommended)**

Use `run_data_collection.sh` to start data collection in one command.

**Usage:**

`genie_sim/source/data_collection$ ./scripts/run_data_collection.sh [OPTIONS]` `Copy to clipboard Error Copied`

**Options:**

- `--headless` - Run in headless mode for better performance (default: false)
- `--no-record` - Disable recording (default: record enabled)
- `--task TASK_PATH` - Task template path (e.g. `tasks/geniesim_2025/sort_fruit/g2/sort_the_fruit_into_the_box_apple_g2.json` )
- `--standalone` - Run in standalone mode (only save logs, no terminal output) (default: false)
- `--container-name NAME` - Container name (default: `data_collection_open_source` )
- `--help, -h` - Show help message

**Examples:**

`# Run with default task in GUI mode
genie_sim/source/data_collection$ ./scripts/run_data_collection.sh

# Run with default task in GUI mode with custom task
genie_sim/source/data_collection$ ./scripts/run_data_collection.sh --task tasks/geniesim_2025/sort_fruit/g2/sort_the_fruit_into_the_box_apple_g2.json

# Run in headless mode with custom task
genie_sim/source/data_collection$ ./scripts/run_data_collection.sh --headless --task tasks/geniesim_2025/sort_fruit/g2/sort_the_fruit_into_the_box_apple_g2.json

# Run in standalone headless mode (logs only, no terminal output)
genie_sim/source/data_collection$ ./scripts/run_data_collection.sh --standalone --headless

# Run without recording
genie_sim/source/data_collection$ ./scripts/run_data_collection.sh --no-record` `Copy to clipboard Error Copied`

**Logs:** Logs are saved to `logs/{TASK_NAME}/` directory:

- `run_data_collection_sh.log` - Script output
- `container.log` - Container logs
- `data_collector_server.log` - Data collector server logs (if available)
- `run_data_collection.log` - run data collection application logs (if available)

**Outputs:** Outputs are save to `recording_data/[{TASK_NAME}_{INDEX}]/` directory

1. **Interactive Mode**

Use `start_gui.sh` to launch an interactive container for debugging or development.

**Usage:**

`genie_sim/source/data_collection$ ./scripts/start_gui.sh [ACTION] [CONTAINER_NAME]` `Copy to clipboard Error Copied`

**Actions:**

- `run` (default) - Create and run a new container
- `exec` - Enter an existing container
- `start` - Start a stopped container
- `restart` - Restart a container

**Parameters:**

- `ACTION` - One of: `exec` , `start` , `restart` , `run` (default: `run` )
- `CONTAINER_NAME` - Container name (default: `data_collection_open_source` )

**Examples:**

`# Create and run a new container (default)
genie_sim/source/data_collection$ ./scripts/start_gui.sh run my_container

# Enter an existing container
genie_sim/source/data_collection$ ./scripts/start_gui.sh exec my_container

# Start a stopped container
genie_sim/source/data_collection$ ./scripts/start_gui.sh start my_container

# Restart a container
genie_sim/source/data_collection$ ./scripts/start_gui.sh restart my_container` `Copy to clipboard Error Copied`

**Running Services Inside Container:**

After entering the container using `exec` , you need to start two services in separate terminals:

**Terminal 1 - Start the container and run data collector server:**

`# Enter the container
genie_sim/source/data_collection$ ./scripts/start_gui.sh exec my_container

# Inside container, start data collector server
isaac-sim@user:/geniesim/main/data_collection$ python scripts/data_collector_server.py --enable_physics --enable_curobo --publish_ros` `Copy to clipboard Error Copied`

**Terminal 2 - Enter the same container and run data collection application:**

`# Enter the same container (in a new terminal)
genie_sim/source/data_collection$ ./scripts/start_gui.sh exec my_container

# Inside container, run main application
isaac-sim@user:/geniesim/main/data_collection$ python scripts/run_data_collection.py --task_template tasks/geniesim_2025/sort_fruit/g2/sort_the_fruit_into_the_box_apple_g2.json --use_recording` `Copy to clipboard Error Copied`

**Note:** Both terminals need to `exec` into the same container. Make sure the container is running before executing these commands.

For more info about **local installation** and **task configuration, ** see `source/data_collection/README.md`

### [3.4 Scene Reconstruction](#/v3?id=_34-scene-reconstruction)

#### [3.4.1 Data Introduction](#/v3?id=_341-data-introduction)

1. Data Acquisition

Collect data using Skyland Innovation's MetaCam handheld 3D laser scanner.

1. Data Format

`# The following data is the result of processing the collected raw data using
# Skylandx's software. ├── camera
│   └── left
│       ├── 1763982134704786000 .jpg # fisheye image │       ├── .. .
│       ├── .. .
│       ├── 1763982135704717000 .jpg
├── colorized.las # color point cloud data ├── info
│   ├── calibration.json # Calibration information between multiple sensors.  eg: camera intrinsic │   ├── device_info.json
│   └── rtk_info.json
└── transforms.json # camera pose info, camera pose is CG convention, Our open-source code will  automatically to convert it.` `Copy to clipboard Error Copied`

#### [3.4.2 Environment Installation](#/v3?id=_342-environment-installation)

House.zip contains the demo data required to run the scene reconstruction examples in this guide.

[House.zip](https://modelscope.cn/datasets/agibot_world/GenieSim3.0-Dataset/tree/master/reconstruction_source_data)

`# Pull codebase
# Scene reconstruction repo
git clone https://github.com/AgibotTech/genie_sim.git cd genie_sim/source/scene_reconstruction # BUild docker image
docker build . -t docker-image-name # Unzip House.zip and launch container
docker run --rm --gpus all -it --shm-size = 32g -v $( pwd ) /House:/mnt registry.agibot.com/real2sim/cuda:11.8.0-cudnn8-devel-ubuntu22.04-benchmark # Download weights of Difix3d and place them in the  genie_sim/source/scene_reconstruction/third_party/Difix3D/hf_model  directory hf_model/ | -- LICENSE.txt | -- NOTICE | -- README.md | -- model_index.json | -- scheduler | -- text_encoder | -- tokenizer | -- unet
`-- vae` `Copy to clipboard Error Copied`

#### [3.4.3 Run Scene Reconstruction](#/v3?id=_343-run-scene-reconstruction)

Run the following command inside the container to implement scene reconstruction.

`# /mnt -> data_path     1 -> Enable DIfix3D (0 to disable)
cd /root/third_party/gsplat/examples sh real2sim_environment_entrypoint.sh  /mnt 1` `Copy to clipboard Error Copied`

To covert PLY file to USDZ and import into Isaac Sim, follow the "Converting PLY Files to USDZ" section in the NVIDIA [3DGRUT repository](https://github.com/nv-tlabs/3dgrut?tab=readme-ov-file#converting-ply-files-to-usdz) (nv-tlabs/3dgrut).

`python -m threedgrut.export.scripts.ply_to_usd path/to/your/model.ply --output_file path/to/output.usdz` `Copy to clipboard Error Copied`

### [3.5 AgiBot World Challenge Reasoning to Action Tasks (ICRA)](#/v3?id=_35-agibot-world-challenge-reasoning-to-action-tasks-icra)

**NOTE: The ICRA challenge is based on GenieSim 3.0.3. Please make sure you are using the correct version (latest commit:** **`8bf3e57a`** **).**

#### [3.5.1 Run Baseline Model Inference](#/v3?id=_351-run-baseline-model-inference)

1. Docker Image Preparation

Baseline model checkpoints and inference scripts are integrated into one unified docker image, which can be obtained by following steps:

On the My submission page of the Test Server, click Get Registry Token to obtain the docker login credentials，then pull the image through the following command. (Note that the validity period of the voucher is 1 hour)

`docker pull sim-icra-registry.cn-beijing.cr.aliyuncs.com/icra-admin/openpi_server:latest` `Copy to clipboard Error Copied`

1. Start model inference

Start docker container will automatically launch the inference service

`docker run -it --network=host  --gpus all -e XLA_PYTHON_CLIENT_MEM_FRACTION=0.3 {docker container name}` `Copy to clipboard Error Copied`

Adjust `XLA_PYTHON_CLIENT_MEM_FRACTION` according to your machine GPU memory to run both inference and simulation on one machine.

The following info in terminal indicates the successful launch of the Inference service:

```
INFO:websockets.server:server listening on 0.0.0.0:8999
```

#### [3.5.2 Run ICRA tasks](#/v3?id=_352-run-icra-tasks)

1. Start simulation docker container

`genie_sim$ ./scripts/start_gui.sh` `Copy to clipboard Error Copied`

1. After starting inference service, enter the docker container to launch all ICRA tasks a. Config VLM checker Set OpenAI configs for VLM auto scoring, see Section 3.1.4 for details. `export BASE_URL=xxx export VL_MODEL=xxx export API_KEY=xxx` Copy to clipboard Error Copied Two tasks, `scoop_popcorn` and `clean_the_desktop` are evaluated by VLM while other tasks are evaluated by rules. The absence of VLM configuration will not affect the simulation run, but the evaluation will be missing. b. Launch ICRA tasks

`# Enter simulation container
genie_sim$ ./scripts/into.sh
# Run ICRA tasks with inference service from localhost:8999
/geniesim/main$ ./scripts/run_icra_tasks.sh
# Run ICRA tasks with inference service from other host machine
/geniesim/main$ ./scripts/run_icra_tasks.sh --infer-host xxx.xxx.xxx.xxx:8999` `Copy to clipboard Error Copied`

1. Scores will be automatically collected when all tasks are finished. It can also be triggered by command below

`# Use default directory: output/benchmark
/geniesim/main$ python3 scripts/stat_average.py

# Specify a custom directory
/geniesim/main$ python3 scripts/stat_average.py /path/to/your/output` `Copy to clipboard Error Copied`

1. Evaluation process will be automatically terminated when SIGINT (Ctrl+C) signal is received.

#### [3.5.3 Integrate Your Own Policy](#/v3?id=_353-integrate-your-own-policy)

Prepare the docker image of your policy, including dependency, inference scripts and checkpoints etc.

1. Inference and simulation are separated into two containers, where websockets serve as the communication tool. Consequently, inference must be implemented in the form of a websocket service. An example can be found at `scripts/serve_policy.py` in the inference container.
2. Observations that can be obtained from simulation environments

- Observation Structure `payload = { "state" : robot joint state , "eef" : { "left" : left_eef , "right" : right_eef , } , "images" : { "top_head" : rgb image from head , "hand_left" : rgb image from left wrist , "hand_right" : rgb image from right wrist , } , "depth" : { "top_head" : depth from head , "hand_left" : depth from left wrist , "hand_right" : depth from right wrist } , "prompt" : task_instruction , "task_name" : task_name }` Copy to clipboard Error Copied
- Observation Info

| **key**           | **type**   | **shape**   | **comments**                                                                             |
|-------------------|------------|-------------|------------------------------------------------------------------------------------------|
| state             | nparray    | (32, )      | 0-7 left arm; 7-14 right arm; 14-15 left gripper; 15-16 right gripper; 16-21 waist joint |
| left_eef          | list       | 7           | x, y, z, qw, qx, qy, qz                                                                  |
| right_eef         | list       | 7           | x, y, z, qw, qx, qy, qz                                                                  |
| images-top_head   | nparray    | (3, H, W)   | rgb image from head camera                                                               |
| images-hand_left  | nparray    | (3, H, W)   | rgb image from left wrist camera                                                         |
| images-hand_right | nparray    | (3, H, W)   | rgb image from right wrist camera                                                        |
| depth-top_head    | nparray    | (H, W)      | depth from head wrist camera                                                             |
| depth-hand_left   | nparray    | (H, W)      | depth from left wrist camera                                                             |
| depth-hand_right  | nparray    | (H, W)      | depth from right wrist camera                                                            |
| prompt            | string     | /           | task instructions                                                                        |
| task_name         | string     | /           | task name                                                                                |

1. Commands that simulation environments receive

- Command structure `result = { # action chunk "actions":[ [cmd], [cmd], [cmd], ... ] }` Copy to clipboard Error Copied
- Command type Two types of commands are supported:
    - Abs joint For abs joint command, the command order is identical to joint state order specified above.
    - Abs eef For abs eef command, the command order is as follows **Index Range Name  Meaning** 0-6 xyzrpy Left arm eef 6-12 xyzrpy Right arm eef 12-13 idx41\_gripper\_l\_outer\_joint1 Left gripper 13-14 idx81\_gripper\_r\_outer\_joint1 Right gripper 14-19 idx01\_body\_joint1 - idx05\_body\_joint5 Waist

Tools are provided to convert ik/fk for robot at path `source/geniesim/utils/g2_ikfk_converter.py` , check the script for detailed usage.

#### [3.5.4 Submit Your Policy](#/v3?id=_354-submit-your-policy)

- **Obtain Credentials** : You can obtain your Docker login credentials by clicking the **"Get Registry Token"** button on the **My Submissions** page of the Test Server. (Note that the validity period of the voucher is 1 hour)
- **Build the Image** : Integrate all necessary components-including dependencies, model checkpoints, and inference scripts-into a single Docker image.
- **Configure Port and Entrypoint** :
    1. **Port Requirement** : Your inference service **must** be configured to listen on port **8999** .
    2. **Startup** : Ensure the Docker image is configured to start the inference container directly via an `ENTRYPOINT` or `CMD` instruction, without requiring any additional commands at runtime.
- **Tag and Push** : Tag your image according to the registry endpoint and namespace provided. For example, if your registry endpoint is `registry.test.com` and your namespace is `test1` , your image should be tagged and pushed as follows:
    1. **Tag format** : `registry.test.com/test1/{image_name}:tag`
    2. **Command** : `docker push registry.test.com/test1/{image_name}:tag`
- **Specify Model Type** : Choose your model type `abs_joint` or `abs_pose` on the submission page according to your model.

**Troubleshooting &amp; Optimization**

- **Credential Expiration:** If the image is too large to complete the upload within the credential's validity period, simply refresh your login credentials and re-initiate the push. Docker's layer-based architecture ensures that previously successful layers are preserved; only the remaining layers will be transmitted.
- **Image Optimization:** If the push continues to fail, please optimize the Docker image to reduce its footprint. We recommend:
    - Cleaning up builds caches and unnecessary dependencies.
    - Implementing **multi-stage builds** to minimize the final image size.

### [3.6 Reinforcement Learning with RLinf](#/v3?id=_36-reinforcement-learning-with-rlinf)

This section describes how to run reinforcement learning training on GenieSim using the RLinf framework. The example task is `Place Workpiece` - control the G2 robot's right arm to place a workpiece into a target slot.

Key features:

- Isaac Sim + MuJoCo dual-simulator: Isaac Sim for high-fidelity rendering (30 Hz), MuJoCo for high-frequency physics (1000 Hz)
- SpaceMouse human-in-the-loop: the operator can intervene during RL training in real time
- RLPD + BC regularization: demonstrations feed both demo buffer (symmetric sampling) and behavioral cloning loss
- SAC + CNN Encoder: ResNet-10 encodes wrist camera images, SAC optimizes continuous actions

#### [3.6.1 Repository Setup](#/v3?id=_361-repository-setup)

Clone both GenieSim and RLinf repositories into the same parent directory:

`mkdir workspace && cd workspace git clone https://github.com/AgibotTech/genie_sim.git git clone -b dev/geniesim https://github.com/RLinf/RLinf.git` `Copy to clipboard Error Copied`

Directory layout:

`workspace/
├── genie_sim/     # GenieSim repository
└── RLinf/         # RLinf repository` `Copy to clipboard Error Copied`

Make sure GenieSim assets are downloaded at `genie_sim/source/geniesim/assets` (see Section 2.2).

#### [3.6.2 Docker Image Build](#/v3?id=_362-docker-image-build)

The RLinf integration uses a two-layer Docker image:

- **Layer 1 (base):** GenieSim + Isaac Sim + MuJoCo + ROS 2
- **Layer 2 (training):** RLinf + PyTorch + training dependencies

**Step 1 - Build GenieSim base image**

Follow Section 2.3.1 to build the GenieSim base image first.

**Step 2 - Build RLinf integration image**

`cd workspace/ bash genie_sim/scripts/build_geniesim_rlinf_image.sh` `Copy to clipboard Error Copied`

Output: `geniesim-rlinf:latest`

**Step 3 - Build training image**

`cd workspace/RLinf docker build \ --build-arg BUILD_TARGET = embodied-geniesim \ -t geniesim-rlinf-train:latest \ -f docker/Dockerfile \ .` `Copy to clipboard Error Copied`

**Step 4 - Verify**

`docker run --rm --gpus all geniesim-rlinf-train:latest nvidia-smi` `Copy to clipboard Error Copied`

#### [3.6.3 SpaceMouse Setup](#/v3?id=_363-spacemouse-setup)

The SpaceMouse communicates via HID. Install the required library and configure udev rules **on the host machine** (not inside the container):

`sudo apt-get install -y libhidapi-dev` `Copy to clipboard Error Copied`

Create a udev rule:

`sudo tee /etc/udev/rules.d/99-spacemouse.rules > /dev/null << 'EOF'
SUBSYSTEM=="hidraw", ATTRS{idVendor}=="256f", ATTRS{idProduct}=="c635", MODE="0666"
SUBSYSTEM=="input",  ATTRS{idVendor}=="256f", ATTRS{idProduct}=="c635", MODE="0666"
EOF` `Copy to clipboard Error Copied`

Reload:

`sudo udevadm control --reload-rules sudo udevadm trigger ls -l /dev/hidraw* # should show 0666 permissions` `Copy to clipboard Error Copied`

#### [3.6.4 Download Pretrained Weights](#/v3?id=_364-download-pretrained-weights)

Download the ResNet-10 CNN encoder weights used by the SAC policy:

`# Method 1: git clone
git lfs install
git clone https://huggingface.co/RLinf/RLinf-ResNet10-pretrained # Method 2: huggingface-hub
# For mainland China: export HF_ENDPOINT=https://hf-mirror.com pip install huggingface-hub
huggingface-cli download RLinf/RLinf-ResNet10-pretrained --local-dir RLinf-ResNet10-pretrained` `Copy to clipboard Error Copied`

Place the downloaded directory under `RLinf/examples/embodiment/config/` (or update the path in training config accordingly).

#### [3.6.5 Collect Demonstration Data](#/v3?id=_365-collect-demonstration-data)

Connect the SpaceMouse via USB, then run:

`cd workspace/ bash RLinf/rlinf/envs/geniesim/scripts/run.sh collect --num-demos 50` `Copy to clipboard Error Copied`

Optional - specify a custom save directory:

`bash RLinf/rlinf/envs/geniesim/scripts/run.sh collect --num-demos 50 --save-dir /geniesim/RLinf/my_demos` `Copy to clipboard Error Copied`

**SpaceMouse controls:**

| **Action**         | **Effect**                                     |
|--------------------|------------------------------------------------|
| Translate device   | Move right arm end-effector (x/y/z)            |
| Rotate device      | Rotate right arm end-effector (roll/pitch/yaw) |
| Press left button  | Save demo → environment resets                 |
| Press right button | Discard demo → environment resets              |

Demos are saved to `workspace/RLinf/sac_demo/` on the host (mapped from `/geniesim/RLinf/sac_demo` inside the container).

#### [3.6.6 Convert Demonstration Data](#/v3?id=_366-convert-demonstration-data)

Convert collected demonstrations into a replay buffer for SAC training:

`bash RLinf/rlinf/envs/geniesim/scripts/run.sh convert` `Copy to clipboard Error Copied`

Reads from `/geniesim/RLinf/sac_demo` and outputs to `/geniesim/RLinf/sac_demo_buffer` by default. Customize paths:

`bash RLinf/rlinf/envs/geniesim/scripts/run.sh convert \ --demo-dir /geniesim/RLinf/my_demos \ --output-dir /geniesim/RLinf/my_demos_buffer` `Copy to clipboard Error Copied`

#### [3.6.7 Start Training](#/v3?id=_367-start-training)

Before starting training, edit the training config file `RLinf/examples/embodiment/config/geniesim_sac_spacemouse.yaml` and update the following paths (RLinf is mounted at `/geniesim/RLinf` inside the container):

- `rollout.model.model_path` and `actor.model.model_path` : set to the pretrained model directory, e.g. `/geniesim/RLinf/examples/embodiment/config/RLinf-ResNet10-pretrained`
- `algorithm.demo_buffer.load_path` : set to the converted buffer directory, e.g. `/geniesim/RLinf/sac_demo_buffer`

Then start training:

`bash RLinf/rlinf/envs/geniesim/scripts/run.sh train` `Copy to clipboard Error Copied`

During training, env\_0 accepts real-time SpaceMouse intervention while remaining environments are driven by the policy.

**Override Hydra parameters:**

`# Adjust discount factor
bash RLinf/rlinf/envs/geniesim/scripts/run.sh train algorithm.gamma = 0.97
# Adjust BC regularization coefficient
bash RLinf/rlinf/envs/geniesim/scripts/run.sh train algorithm.bc_coef = 5.0
# Change log path
bash RLinf/rlinf/envs/geniesim/scripts/run.sh train runner.logger.log_path = .. /my_results` `Copy to clipboard Error Copied`

#### [3.6.8 Monitoring and Debugging](#/v3?id=_368-monitoring-and-debugging)

**TensorBoard**

Start TensorBoard to monitor training progress:

`tensorboard --logdir workspace/results/` `Copy to clipboard Error Copied`

**Debug Shell**

Start an interactive shell inside the container for debugging:

`bash RLinf/rlinf/envs/geniesim/scripts/run.sh shell` `Copy to clipboard Error Copied`

View simulation logs of a running container:

`docker exec -it < container_name > bash
ls /tmp/geniesim_logs/` `Copy to clipboard Error Copied`

#### [3.6.9 Command Reference](#/v3?id=_369-command-reference)

| **Command**                         | **Description**                         |
|-------------------------------------|-----------------------------------------|
| `run.sh collect --num-demos N`      | Collect N demonstrations via SpaceMouse |
| `run.sh convert`                    | Convert demo files to replay buffer     |
| `run.sh train [hydra overrides...]` | Start SAC + SpaceMouse HIL training     |
| `run.sh shell`                      | Interactive container shell             |
| `run.sh help`                       | Show all commands                       |

#### [3.6.10 Key Configuration Files](#/v3?id=_3610-key-configuration-files)

| **File**                                                       | **Description**                                                |
|----------------------------------------------------------------|----------------------------------------------------------------|
| `examples/embodiment/config/env/geniesim_place_workpiece.yaml` | Environment config (obs/action dims, SHM settings, body names) |
| `examples/embodiment/config/geniesim_sac_spacemouse.yaml`      | Training config (algorithm, model paths, demo buffer)          |
| `examples/embodiment/config/model/cnn_policy.yaml`             | Model config (ResNet-10 encoder, actor/critic architecture)    |

#### [3.6.11 Troubleshooting](#/v3?id=_3611-troubleshooting)

| **Problem**                                | **Fix**                                                        |
|--------------------------------------------|----------------------------------------------------------------|
| `PermissionError` on `/dev/shm/geniesim_*` | Run: `bash RLinf/rlinf/envs/geniesim/scripts/cleanup_stale.sh` |
| Stale `.geniesim_idle` causing hang        | Same cleanup script above                                      |
| Isaac Sim startup timeout                  | Increase `startup_timeout_sec` in env YAML                     |
| GPU out of memory                          | Reduce `env.train.total_num_envs` via Hydra override           |