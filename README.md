# google-colab
* to push files besides python notebooks to repo
* !git remote add origin https://username:password@github.com/username/repo-name.git
* Note: if your password contains '@' character use '%40' instead of that...

# Setup
* First open & run eth-brownie-setup.ipynb. This setups up the blockchain
* Then open & run eth-brownie-contract.ipynb. This deploys the contract
* Open & run eth_brownie_ai_dataset.ipynb. This shows the sample data set

* To include code modules from other folders/ parent folder /content/google-colab:
```python
import sys
sys.path.append('/content/google-colab/')
```
