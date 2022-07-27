FROM python:3.8

RUN pip install numpy torch python-dateutil

ADD ca_proteinmpnn/protein_mpnn_run.py /opt/ca_proteinmpnn/protein_mpnn_run.py
ADD ca_proteinmpnn/protein_mpnn_utils.py /opt/ca_proteinmpnn/protein_mpnn_utils.py
ADD ca_proteinmpnn/helper_scripts /opt/ca_proteinmpnn/helper_scripts
ADD ca_proteinmpnn/ca_model_weights /opt/ca_proteinmpnn/ca_model_weights

ADD vanilla_proteinmpnn/protein_mpnn_run.py /opt/vanilla_proteinmpnn/protein_mpnn_run.py
ADD vanilla_proteinmpnn/protein_mpnn_utils.py /opt/vanilla_proteinmpnn/protein_mpnn_utils.py
ADD vanilla_proteinmpnn/helper_scripts /opt/vanilla_proteinmpnn/helper_scripts
ADD vanilla_proteinmpnn/vanilla_model_weights /opt/vanilla_proteinmpnn/vanilla_model_weights