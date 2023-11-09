which brew > /dev/null
set is_exist_brew $status

function update_brew --description 'Update brew'
    if test $is_exist_brew -eq 0
        echo "Running brew update..."
        brew update
        echo "Running brew upgrade..."
        brew upgrade
        if test (os_info -t) = "OS type: Mac OS"
            echo "Running brew cask upgrade..."
            brew upgrade --cask
        end
        echo "Running brew cleanup..."
        brew cleanup
    else
        echo "brew not installed!"
    end
end
