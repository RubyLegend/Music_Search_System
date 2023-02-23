#!/usr/bin/env python3

# Script to export data from Genius and put it into local database

# importing libraries
import requests
# import cloudscraper #cloudflare v2 block
# import webbrowser - don't needed anymore, but will save it, mb for future
from bs4 import BeautifulSoup
import sys
from selenium import webdriver
import html2text
import os
import re
import pymysql.cursors
from SQL_functions import *

# Connection data to Genius
client_access_token = os.getenv('GeniusToken')

#Working, don't touch
def write_artists_songs(connection, data):
        #Getting index of a last row
        it = int(select(connection,'count(*)', '`Authors`')[0]['count(*)'])
        it2 = int(select(connection, 'count(*)', '`Songs`')[0]['count(*)'])
        #Insert in Authors table
        #Split string for artists
        temp = ''
        for x in data['writer_artists']: 
            temp = str(x['name'])
            temp2 = temp.split(',')
            temp = ''
            for y in temp2:
                temp3 = y.split('&')
                #Insert every splitted artist in database
                for x in temp3:
                    x = x.strip()
                    result = select_where(connection, '*', '`Authors`', 'Name like %s', x) 
                    #If no records with same Author
                    if (result == ()):
                        insert(connection, '`Authors`', '(%s, %s)', (it+1, x))
                        it += 1
                    result2 = int(select_where(connection, 'ID', '`Authors`', 'Name like %s', x)[0]['ID'])
                    result3 = select_where(connection, '*', '`Songs`', 'Name like %s and ID_Author = %s', (data['title'], result2))
                    result4 = int(select_where(connection, 'ID', '`Lyrics`', 'URL like %s', data['url'])[0]['ID'])
                    result5 = 1
                    for x in data['media']:
                        if x['provider'] == 'youtube':
                            result5 = int(select_where(connection, 'ID', 'YT_Videos', 'URL like %s', x['url'])[0]['ID'])
                            break
                    if(result3 == ()):
                        insert(connection, '`Songs`', '(%s, %s, %s, %s, 1, %s, %s)', (it2+1, data['title'], result2, result4, result5, data['release_date']))
                        it2 += 1
        
        #Split string for artists
        temp = ''
        for x in data['featured_artists']: 
            temp = str(x['name'])
            temp2 = temp.split(',')
            temp = ''
            for y in temp2:
                temp3 = y.split('&')
                #Insert every artist in database
                for x in temp3:
                    x = x.strip()
                    result = select_where(connection, '*', '`Authors`', 'Name like %s', x) 
                    #If no records with same Author
                    if (result == ()):
                        insert(connection, '`Authors`', '(%s, %s)', (it+1, x))
                        it += 1
                    result2 = int(select_where(connection, 'ID', '`Authors`', 'Name like %s', x)[0]['ID'])
                    result3 = select_where(connection, '*', '`Songs`', 'Name like %s and ID_Author = %s', (data['title'], result2))
                    result4 = int(select_where(connection, 'ID', '`Lyrics`', 'URL like %s', data['url'])[0]['ID'])
                    result5 = 1
                    for x in data['media']:
                        if x['provider'] == 'youtube':
                            result5 = int(select_where(connection, 'ID', 'YT_Videos', 'URL like %s', x['url'])[0]['ID'])
                            break
                    if(result3 == ()):
                        insert(connection, '`Songs`', '(%s, %s, %s, %s, 1, %s, %s)', (it2+1, data['title'], result2, result4, result5, data['release_date']))
                        it2 += 1

        #Split string for artists
        temp = '' 
        temp = str(data['primary_artist']['name'])
        temp2 = temp.split(',')
        temp = ''
        for y in temp2:
            temp3 = y.split('&')
            #Insert every artist in database
            for x in temp3:
                x = x.strip()
                result = select_where(connection, '*', '`Authors`', 'Name like %s', x) 
                #If no records with same Author
                if (result == ()):
                    insert(connection, '`Authors`', '(%s, %s)', (it+1, x))
                    it += 1
                result2 = int(select_where(connection, 'ID', '`Authors`', 'Name like %s', x)[0]['ID'])
                result3 = select_where(connection, '*', '`Songs`', 'Name like %s and ID_Author = %s', (data['title'], result2))
                result4 = int(select_where(connection, 'ID', '`Lyrics`', 'URL like %s', data['url'])[0]['ID'])
                result5 = 1
                for x in data['media']:
                    if x['provider'] == 'youtube':
                        result5 = int(select_where(connection, 'ID', 'YT_Videos', 'URL like %s', x['url'])[0]['ID'])
                        break
                if(result3 == ()):
                    insert(connection, '`Songs`', '(%s, %s, %s, %s, 1, %s, %s)', (it2+1, data['title'], result2, result4, result5, data['release_date']))
                    it2 += 1

#Working, don't touch
def write_albums(connection, data):
        #Insert in Albums table
        #Getting last index in table
        it = int(select(connection,'count(*)', '`Albums`')[0]['count(*)'])
        it2 = int(select(connection, 'count(*)', '`Songs_in_albums`')[0]['count(*)'])

        if(data['album'] == None):
            result = select_where(connection, '*', '`Albums`', 'Name like \'None\'', None)
            if(result == ()):
                insert(connection, '`Albums`', "(%s, NULL, 'None', NULL)", it+1)
                it += 1
        else:
            result = select_where(connection, '*', '`Albums`', 'Name like %s', data['album']['name'])

            #If no records with same Album
            if (result == ()):
                token = 'Bearer {}'.format(client_access_token)
                headers = {
                    'Authorization': token
                }
                url = 'https://api.genius.com' + str(data['album']['api_path'])
                   
                r = requests.get(url, headers=headers)
                data_temp = r.json()

                #Finding id of album owner in database
                result = select_where(connection, 'ID', '`Authors`', 'Name like %s', data['album']['artist']['name'])
                id_author = ''
                if(result == ()):
                    it2 = int(select(connection,'count(*)', '`Authors`')[0]['count(*)'])
                    insert(connection, '`Authors`', '(%s, %s)', (it2+1, data['album']['artist']['name']))
                    id_author = it2+1
                else:
                    id_author = result[0]['ID']
                    
                if(data_temp['response']['album']['release_date'] == None):
                    insert(connection, '`Albums`', '(%s, %s, %s, NULL)', (it+1, id_author, data_temp['response']['album']['name']))
                    it += 1
                else:
                    insert(connection, '`Albums`', '(%s, %s, %s, %s)', (it+1, id_author, data_temp['response']['album']['name'], data_temp['response']['album']['release_date']))
                    it += 1

#Working, don't touch
def write_songs_in_albums(connection, data):
    it = int(select(connection, 'count(*)', '`Songs_in_albums`')[0]['count(*)'])

    album_name = ''
    if(data['album'] == None):
        album_name = 'None'
    else:
        token = 'Bearer {}'.format(client_access_token)
        headers = {
        'Authorization': token
        }
        url = 'https://api.genius.com' + str(data['album']['api_path'])

        r = requests.get(url, headers=headers)
        data_temp = r.json()
        album_name = data_temp['response']['album']['name']

    result = select_where(connection, 'ID', '`Albums`', 'Name like %s', album_name)
    lyrics_id = select_where(connection, 'ID', '`Lyrics`', 'URL like %s', data['url'])
    result2 = select_where(connection, 'ID', '`Songs`', 'Name like %s and ID_Lyrics = %s', (data['title'], lyrics_id[0]['ID']))        

    for x in result2:
        find = select_where(connection, 'ID_Song', '`Songs_in_albums`', 'ID_Song = %s', x['ID'])
        if(find == ()):
            insert(connection, '`Songs_in_albums`', '(%s, %s, %s)', (it+1, x['ID'], result[0]['ID']))
            it += 1

#Working, don't touch
def write_lyrics(connection, data):
    #Getting last index in table
    it = int(select(connection,'count(*)', '`Lyrics`')[0]['count(*)'])

    #Checking, if those lyrics are already in database
    result = select_where(connection, '*', '`Lyrics`', 'URL like %s', data['url'])

    #If there is not such lyrics...
    if(result == ()):
        #Then add it :)
        insert(connection, '`Lyrics`', '(%s, %s)', (it+1, data['url']))

#Working, don't touch
def write_videos(connection, data):
    for x in data['media']:
        if(x['provider'] == 'youtube'):
            result = select_where(connection, '*', 'YT_Videos', 'URL like %s', x['url'])
            
            if(result == ()):
                insert(connection, 'YT_Videos(URL)', '(%s)', (x['url']))
            break

def add_to_database(data):
    connection = pymysql.connect(host='localhost',
                             user='root',
                             password='YAELfvk5Jgt8qRTc',
                             database='Music_Search_System',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

    with connection:
        write_lyrics(connection, data) 
        write_videos(connection, data)
        write_artists_songs(connection, data)
        write_albums(connection, data)
        write_songs_in_albums(connection, data)
        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()

def web_browser_fetch(url, display):
            print("Getting lyrics...")

            FirefoxOptions = webdriver.FirefoxOptions()
            FirefoxOptions.add_argument('-headless')
            FirefoxOptions.binary_location = "/opt/firefox/firefox-bin"
            browser = webdriver.Firefox(options=FirefoxOptions)
            browser.install_addon(os.path.realpath('./uBlock.xpi'), temporary=True)
            browser.get(url)
            content = browser.page_source
            browser.close()
        
            # Parsing the html 
            parse = BeautifulSoup(content, 'html.parser')
            # Removing all href`s (unnecesary links)
            for a in parse.findAll('a'):
                del a['href']
            # Provide html elements' attributes to extract the data 
            lyrics_html = parse.find_all('div', attrs={'data-lyrics-container': 'true'})
            #if Genius loaded old site
            lyrics_html = lyrics_html + parse.find_all('section', attrs={'class': '',
                                                                         'ng-hide': 'lyrics_ctrl.should_show_lyrics_edit_form() || lyrics_ctrl.should_show_lyrics_edit_proposal_form()'})
    
            #Converting html lyrics to text
            lyrics = ''
            for x in lyrics_html:
                lyrics = lyrics + html2text.html2text(str(x))
        
            if(display == 1):
                print("-----------------------------")
                print(lyrics)

            # Writing extracted data in a txt file
            with open('index.txt', 'w') as text:
              text.write(lyrics)
            if(display == 1):
                print("-----------------------------")
                
            print("Done. You can look for a lyrics in an 'index.txt' file.")
    

def get_lyrics(artist, song, open_video, display, is_text, auto_add, debug):
    base_url = 'https://api.genius.com/search/'
    
    if (artist == '' and song != ''):
        params = {'q': song}
    else: params = {'q': artist+' '+song}

    token = 'Bearer {}'.format(client_access_token)
    headers = {
    'Authorization': token
    }
    r = requests.get(base_url, params=params, headers=headers)
    json_data = r.json()
   
    if(json_data['response']['hits'] == []):
        print("No lyrics were found")
    else:
        i = 1
        print("Results:")
        for x in json_data['response']['hits']:
            print(str(i) + ": " + x['result']['title'] + " by " + x['result']['artist_names'], end=' ')
            i += 1

            if(auto_add == 1):
                url = 'https://api.genius.com' + str(x['result']['api_path'])
                r = requests.get(url, headers=headers)
                data = r.json()
                add_to_database(data['response']['song'])
                print("| Added.")
            else: print('')

        if (debug == 0) :
            #print("Debug")
            #if(not re.match(song, str(json_data['response']['hits'][0]['result']['full_title'])) and is_text == 0):
            #    print("Not exact match, probably wrong lyrics or there is no such song on genius.com")
            
            # Fetching the html
            
            choice = i
            while(choice >= i or choice <= 0):
                try:
                    choice = int(input("Choose track to get lyrics: "))
                except ValueError:
                    print("Wrong input detected. Please, input a number between 1 and " + str(i-1))
                    continue
                else:
                    break
            
            
            web_browser_fetch(json_data['response']['hits'][choice-1]['result']['url'], display)

            if(open_video):
                base_url = 'https://api.genius.com' + str(json_data['response']['hits'][choice-1]['result']['api_path'])
                r = requests.get(base_url, headers=headers)
                json_data = r.json()
                #Opening youtube video
                found = bool(0)
                for x in json_data['response']['song']['media']:
                    if(x['provider'] == 'youtube'):
                        os.system('mpv ' + x['url'])
                        found = True
                if(found == False):
                    print("No video found in database")

def checkToken():
    print(len(client_access_token))
    if(not len(client_access_token) == 64):
        return False
    else: return True

if __name__ == "__main__":
        print('Checking for genius token variable...')
        if(client_access_token == None):
            print("Genius access token isn't set. Please, set 'GeniusToken' variable inside shell.")       
        elif(not checkToken()):
            print("Wrong token. Please re-check your variable.")
        else:

            artist = ''
            song = ''
            open_video = 0
            display = 0
            text = 0
            skip_first = 1
            auto_add = 0
            debug = 0
            for x in sys.argv:
                if(skip_first == 1):
                    skip_first = 0
                    continue
                if(re.match('--artist=.*', x) and artist == ''):
                    artist = re.sub('--artist=', '', x)
                elif(re.match('--song=.*', x) and song == ''):
                    song = re.sub('--song=', '', x)
                elif(re.match('--video', x)):
                    open_video = 1
                elif(re.match('--display', x)):
                    display = 1
                elif(re.match('--text=.*', x)):
                    text = 1
                    song = re.sub('--text=', '', x)
                elif(re.match('--debug', x)):
                    debug = 1
                elif(re.match('--auto_add', x)):
                    auto_add = 1
                else: print("Wrong parameter found: \"" + x + "\", ignored")

            if(text == 0):
                print("Artist: " + artist)
                print("Song: " + song)
            else:
                print("Text: " + song)
            if((artist == '' and song != '')
            or (artist != '' and song != '')):
                get_lyrics(artist, song, open_video, display, text, auto_add, debug)
            else:
                print("Not enough arguments. Need at least --song or --text for working.")
