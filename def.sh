# You can copy this script as it is to ~/.bashrc
# Then run . ~/.bashrc
# And check if everything works running for exaple: def oscilloscope 1 (define "oscilloscope" in 1 sentence)

function def() {
	if [ "$#" == 1 ]; then
		curl -s "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&redirects=1&titles=$1" | jq '.query.pages[].extract'
	elif [ "$#" == 2 ]; then
		curl -s "https://en.wikipedia.org/w/api.php?format=json&action=query&prop=extracts&exintro&explaintext&exsentences=$2&redirects=1&titles=$1" | jq '.query.pages[].extract'
	else
		echo 'def [term you want to define] [max amount of sentences]'
	fi
}
