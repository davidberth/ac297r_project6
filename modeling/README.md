# ChildSynth

ChildSynth is a command-line program that uses procedural modeling and ray-
tracing powered by Pov-RAY to generate color images, depth maps, segmen-
tation maps, keypoints, precise height measurements, and auxiliary information
for synthetic children lying on a mat as viewed from different camera angles. The
following example command generates RGB images, depth maps, segmentation
maps, and auxiliary text files with height measurements and other characteris
tics for 5 different camera angles for a total of 15 images.

```bash
python render_children . py -- resy 512 -- resx 512 -- num_children 1
-- output_dir ./ output
```

![example_ragne](https://github.com/davidbert/syntheic/assets/24949723/386142b2-9bd3-4f99-9317-a9cd3f656)
![mae_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/7e16b064-881b-4bcd-ab44-cae6f0844846)
![r2_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/9ba7a287-467d-490e-8fd3-6371ac29f1ab)
![train_loss_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/818ba8e7-7328-4866-9925-a7a0cdc07bc7)
![resnet50_gt_pred_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/48c580db-1665-41b6-8be2-dd0c3fcbe330)














# ChildSynth Modeling Pipeline

## Introduction
Welcome to the **Synthetic Kids' Data Modeling Pipeline for Height Prediction**, a streamlined solution for training, testing, and visualizing deep learning models using synthetic children's data. For accessing the synthetic kids' image dataset, visit the [repository](https://github.com/davidberth/ac297r_project6).

## Features
- **Data Pickle File Transformation**: Turn image data into pickle files for training, testing, and visualization purposes.
- **Automated Directory Management**: Automatically creates `results` and `vis` directories to store metadata, training logs, testing logs, model weights, and visualization diagrams, etc. Under the `results` directory, the script creates a session directory with a unique random hash for each training session.
- **Versatile Script**: Capable of performing training, testing, and visualization in a few lines of bash command.

## Getting Started
To get started with the pipeline, create a conda environment using the provided [`environment.yml`](environment.yml) file with the following command:

```bash
conda env create -f environment.yml
conda activate pytorch
```

# Usage

## Step 1: Prepare the Data
To download the image data, visit the [repository](https://github.com/davidberth/ac297r_project6).

**Transform the image dataset into a pickle file for faster data loading:**
```bash
python3 src/to_pickle.py --data_dir <your_image_data_path> --train_size 0.9
```

## Step 2: Train the Model

**Train the model, save the best model according to the validation set, and make inferences on test data:**
```bash
python3 src/main.py --model_name vgg16 --train_data_dir <your_data_path> --epochs 200 --batch_size 64 --device cuda
```

## Step 3: Visualize the Results

**Visualize all modeling sessions at once:**
```bash
python3 src/vis.py --all True
```

**Visualize a single modeling session:**
```bash
python3 src/vis.py --all False --session_path <your_modeling_session_path>
```

Please replace `<your_image_data_path>` and `<your_data_path>` with the actual paths to your data, and `<your_modeling_session_path>` with the path to your specific modeling session.

## Step 4: Error Analysis

1. Open the Jupyter notebook titled [`error_analysis_demo.ipynb`](error_analysis_demo.ipynb)
2. Locate the line of code that reads:
```python
session_path = <your_modeling_session_path> # Define your session path
```
3. Replace `<your_modeling_session_path>` with the path to your modeling session
4. Run all cells in the notebook to execute the error analysis.


## Configuration Arguments

### For [`to_pickle.py`](src/to_pickle.py)
Customize the data processing with these arguments:

- **`--data_dir`**: Path to the dataset directory. Default: `E:\\synthetic_kids`.
- **`--image_type`**: Type of image (e.g., `depth`, `color`). Default: `depth`.
- **`--mode`**: Dataset mode. Default: `None`.
- **`--expand`**: Maintain 3 channels or average to 1 channel. Default: `True`.
- **`--train_size`**: Proportion of the dataset for training. Default: `0.9`.

### For [`main.py`](src/main.py)
The `main.py` script offers a variety of command-line arguments for customization:

- **`--model_name`**: The model to use. Default: `resnet34`.
- **`--train_data_dir`**: The training data directory. Default: `E:\\db_synthetic_1`.
- **`--epochs`**: Number of training epochs. Default: `100`.
- **`--batch_size`**: Batch size for data processing. Default: `128`.
- **`--learning_rate`**: Learning rate for training. Default: `0.0001`.
- **`--device`**: Device for training (use `mps` for Mac). Default: `cuda`.
- **`--save_interval`**: Model save interval during training (set `-1` for no periodic save). Default: `-1`.
- **`--patience`**: Epochs to wait before early stopping. Default: `30`.
- **`--train_split`**: Dataset ratio for training. Default: `0.8`.
- **`--test_only`**: Perform only inference if `True`. Default: `False`.
- **`--session_path`**: Path to the trained model for testing (required if `--test_only` is `True`).

### For [`vis.py`](src/vis.py)
Configure the visualization of results with these command-line arguments:

- **`--all`**: If set to `True`, visualizes all sessions in the results directory. Default: `True`.
- **`--session_path`**: Specifies the path for visualizing a single session. This argument is not required if `--all` is set to `True`.

Remember to adjust these settings according to your project requirements and system configuration.

# Visualization Snapshot
![acc_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/386142b2-9bd3-4f99-9317-a9cd3f6564e0)
![mae_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/7e16b064-881b-4bcd-ab44-cae6f0844846)
![r2_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/9ba7a287-467d-490e-8fd3-6371ac29f1ab)
![train_loss_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/818ba8e7-7328-4866-9925-a7a0cdc07bc7)
![resnet50_gt_pred_plot](https://github.com/hiyuantang/modeling_pipeline/assets/24949723/48c580db-1665-41b6-8be2-dd0c3fcbe330)


# License
This project is licensed under the MIT License - see the [`LICENSE.md`](LICENSE) file for details.