import { useEffect, useState } from 'react';
import { StyleSheet, Text, FlatList, SafeAreaView, Image, View, TextInput } from 'react-native';
import PersonListItem from './PersonListItem';
import { LOGO, ICON_SETTINGS } from '../../assets'
import HorizontalDivider from './HorizontalDivider';

export default function Home() {
  const [people, setPeople] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);

  useEffect(() => {
    fetch('https://yalies.io/api/people', {
      method: "POST",
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer TOKEN_HERE'
      },
      body: JSON.stringify({
        "filters": {
            "school_code": ["YC"],
        },
        "page": currentPage,
        "page_size": 40,
    })
    }).then((response) => response.json())
      .then((json) => {
        setPeople(people.concat(json));
        console.log(`Fetched page ${currentPage}!`);
      })
      .catch((error) => console.error(error));
  }, [currentPage])
  
  return (
    <View style={styles.container}>
      <SafeAreaView>
        <View style={styles.titleContainer}>
          <Image source={ LOGO } style={styles.logo}/>
          <Text style={styles.titleText}>Yalies</Text>
        </View>
        <TextInput 
          placeholder='Search name, college, or year' 
          placeholderTextColor='gray'
          style={styles.searchBar}
        />
        <HorizontalDivider />
      </SafeAreaView>
      <FlatList 
        data={people}
        keyExtractor={(person) => person.upi}
        onEndReached={(info) => {
          setCurrentPage(currentPage + 1);
        }}
        renderItem={({item}) => <PersonListItem {...item}/>}
        ItemSeparatorComponent={ HorizontalDivider }
        style={styles.peopleList}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  titleContainer: {
    flexDirection: 'row',
    marginLeft: 16,
    marginRight: 16,
  },
  titleText: {
    fontFamily: 'LexendDecaSemiBold',
    fontSize: 32,
    fontWeight: '700',
    color: '#00356b',
    marginLeft: 8,
  },
  logo: {
    width: 40,
    height: 40,
  },
  searchBar: {
    marginLeft: 16,
    marginRight: 16,
    marginTop: 16,
    marginBottom: 8,
    padding: 8,
    fontSize: 16,
    fontFamily: 'LexendDecaRegular',
    borderRadius: 4,
    backgroundColor: '#efefef',
  },
  peopleList: {
    marginLeft: 16,
    marginRight: 16,
  },
});
