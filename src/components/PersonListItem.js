import { StyleSheet, Text, FlatList, SafeAreaView, View, Image } from 'react-native';

export default function PersonListItem({ first_name, last_name, college, year, image }) {
  const yearAbbreviation = year - 2000;

  return (
    <View style={styles.container}>
      <Image source={{ uri: image }} style={styles.photo}/>
      <View style={styles.rightContainer}>
        <Text style={styles.nameText}>{first_name} {last_name}</Text>
        <Text style={styles.collegeYearText}>{college} '{yearAbbreviation}</Text>
      </View>
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    marginTop: 12,
    marginBottom: 8,
  },
  rightContainer: {
    flexDirection: 'column',
    padding: 10,
  },
  photo: {
    width: 60,
    height: 72,
    borderRadius: 10,
    borderWidth: StyleSheet.hairlineWidth,
    borderColor: 'gray',
  },
  nameText: {
    fontFamily: 'LexendDecaRegular',
    fontSize: 16,
  },
  collegeYearText: {
    marginTop: 4,
    color: 'gray',
    fontFamily: 'LexendDecaRegular',
  },
});