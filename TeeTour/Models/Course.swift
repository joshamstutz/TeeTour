import Foundation
import CoreLocation
import MapKit

struct Course: Identifiable, Hashable {
    let id = UUID()
    let rank: Int
    let name: String
    let designer: String
    let yearBuilt: Int
    let par: Int
    let state: String
    let description: String
    let location: CLLocationCoordinate2D
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Course, rhs: Course) -> Bool {
        lhs.id == rhs.id
    }
    
    static let sampleCourses: [Course] = [
        Course(
            rank: 1,
            name: "Pebble Beach Golf Links",
            designer: "Jack Neville and Douglas Grant",
            yearBuilt: 1919,
            par: 72,
            state: "CA",
            description: "Widely regarded as one of the most beautiful courses in the world, Pebble Beach offers stunning views of the Pacific Ocean.",
            location: CLLocationCoordinate2D(latitude: 36.5725, longitude: -121.9486)
        ),
        Course(
            rank: 2,
            name: "Pacific Dunes",
            designer: "Tom Doak",
            yearBuilt: 2001,
            par: 71,
            state: "OR",
            description: "Part of the Bandon Dunes Golf Resort, Pacific Dunes features stunning ocean views and natural terrain.",
            location: CLLocationCoordinate2D(latitude: 43.1777, longitude: -124.3967)
        ),
        Course(
            rank: 3,
            name: "The Ocean Course at Kiawah Island",
            designer: "Pete Dye",
            yearBuilt: 1991,
            par: 72,
            state: "SC",
            description: "Site of the dramatic 1991 Ryder Cup and 2012 PGA Championship, with more oceanside holes than any other course in North America.",
            location: CLLocationCoordinate2D(latitude: 32.6091, longitude: -80.0802)
        ),
        Course(
            rank: 4,
            name: "Whistling Straits (Straits Course)",
            designer: "Pete Dye",
            yearBuilt: 1998,
            par: 72,
            state: "WI",
            description: "A links-style course along Lake Michigan featuring over 1,000 bunkers and host of multiple PGA Championships.",
            location: CLLocationCoordinate2D(latitude: 43.8508, longitude: -87.7005)
        ),
        Course(
            rank: 5,
            name: "Shadow Creek",
            designer: "Tom Fazio",
            yearBuilt: 1989,
            par: 72,
            state: "NV",
            description: "An oasis in the Las Vegas desert, transformed from flat terrain into a lush paradise with streams and waterfalls.",
            location: CLLocationCoordinate2D(latitude: 36.2126, longitude: -115.0630)
        ),
        Course(
            rank: 6,
            name: "Pinehurst No. 2",
            designer: "Donald Ross",
            yearBuilt: 1907,
            par: 72,
            state: "NC",
            description: "Historic course known for its crowned, undulating greens and host to multiple U.S. Opens.",
            location: CLLocationCoordinate2D(latitude: 35.1959, longitude: -79.4693)
        ),
        Course(
            rank: 7,
            name: "Bandon Dunes",
            designer: "David McLay Kidd",
            yearBuilt: 1999,
            par: 72,
            state: "OR",
            description: "The original course at Bandon Dunes Resort, offering a true Scottish-style links experience on the Oregon coast.",
            location: CLLocationCoordinate2D(latitude: 43.1870, longitude: -124.3858)
        ),
        Course(
            rank: 8,
            name: "Bethpage Black",
            designer: "A.W. Tillinghast",
            yearBuilt: 1936,
            par: 71,
            state: "NY",
            description: "Notorious for its difficulty, this public course has hosted the U.S. Open and features a famous warning sign at the first tee.",
            location: CLLocationCoordinate2D(latitude: 40.7392, longitude: -73.4653)
        ),
        Course(
            rank: 9,
            name: "Bandon Trails",
            designer: "Bill Coore and Ben Crenshaw",
            yearBuilt: 2005,
            par: 71,
            state: "OR",
            description: "Winding through coastal forest, meadows, and dunes, offering a different experience from its oceanside siblings.",
            location: CLLocationCoordinate2D(latitude: 43.1823, longitude: -124.3935)
        ),
        Course(
            rank: 10,
            name: "Old Macdonald",
            designer: "Tom Doak and Jim Urbina",
            yearBuilt: 2010,
            par: 71,
            state: "OR",
            description: "A tribute to Charles Blair Macdonald, featuring adaptations of classic holes from renowned courses worldwide.",
            location: CLLocationCoordinate2D(latitude: 43.1761, longitude: -124.3932)
        ),
        Course(
            rank: 11,
            name: "Spyglass Hill",
            designer: "Robert Trent Jones Sr.",
            yearBuilt: 1966,
            par: 72,
            state: "CA",
            description: "Opening with dramatic ocean views before winding through the Del Monte Forest, known for its challenging and varied terrain.",
            location: CLLocationCoordinate2D(latitude: 36.5783, longitude: -121.9500)
        ),
        Course(
            rank: 12,
            name: "Sheep Ranch",
            designer: "Bill Coore and Ben Crenshaw",
            yearBuilt: 2020,
            par: 71,
            state: "OR",
            description: "The newest addition to Bandon Dunes, featuring nine greens along the coastline and stunning Pacific Ocean views.",
            location: CLLocationCoordinate2D(latitude: 43.1902, longitude: -124.4061)
        ),
        Course(
            rank: 13,
            name: "Streamsong (Red)",
            designer: "Bill Coore and Ben Crenshaw",
            yearBuilt: 2012,
            par: 72,
            state: "FL",
            description: "Built on former phosphate mining land in Florida, featuring dramatic elevation changes and rugged terrain unusual for the region.",
            location: CLLocationCoordinate2D(latitude: 27.6651, longitude: -81.9308)
        ),
        Course(
            rank: 14,
            name: "Chambers Bay",
            designer: "Robert Trent Jones Jr.",
            yearBuilt: 2007,
            par: 72,
            state: "WA",
            description: "Site of the 2015 U.S. Open, built on a former sand and gravel mine with sweeping views of Puget Sound.",
            location: CLLocationCoordinate2D(latitude: 47.2024, longitude: -122.5714)
        ),
        Course(
            rank: 15,
            name: "Streamsong (Blue)",
            designer: "Tom Doak",
            yearBuilt: 2012,
            par: 72,
            state: "FL",
            description: "Sister course to the Red, featuring massive dunes, large bunkers, and dramatic contours in central Florida.",
            location: CLLocationCoordinate2D(latitude: 27.6651, longitude: -81.9308)
        ),
        Course(
            rank: 16,
            name: "Mammoth Dunes at Sand Valley",
            designer: "David McLay Kidd",
            yearBuilt: 2018,
            par: 73,
            state: "WI",
            description: "Wide fairways set among restored sand barrens and native vegetation in central Wisconsin.",
            location: CLLocationCoordinate2D(latitude: 44.3366, longitude: -89.8327)
        ),
        Course(
            rank: 17,
            name: "Spanish Bay",
            designer: "Robert Trent Jones Jr., Tom Watson, and Sandy Tatum",
            yearBuilt: 1987,
            par: 72,
            state: "CA",
            description: "Links-style course with ocean views, ecologically sensitive design, and famous bagpiper closing the day.",
            location: CLLocationCoordinate2D(latitude: 36.5977, longitude: -121.9472)
        ),
        Course(
            rank: 18,
            name: "Arcadia Bluffs",
            designer: "Warren Henderson and Rick Smith",
            yearBuilt: 1999,
            par: 72,
            state: "MI",
            description: "Perched on bluffs above Lake Michigan, offering dramatic views and a links-style experience.",
            location: CLLocationCoordinate2D(latitude: 44.4126, longitude: -86.2333)
        ),
        Course(
            rank: 19,
            name: "Sand Valley",
            designer: "Bill Coore and Ben Crenshaw",
            yearBuilt: 2017,
            par: 72,
            state: "WI",
            description: "Minimalist design set among prehistoric sand dunes in the heartland of Wisconsin.",
            location: CLLocationCoordinate2D(latitude: 44.3366, longitude: -89.8327)
        ),
        Course(
            rank: 20,
            name: "TPC Sawgrass (Players Stadium)",
            designer: "Pete Dye",
            yearBuilt: 1980,
            par: 72,
            state: "FL",
            description: "Home of The Players Championship, featuring the iconic island green 17th hole.",
            location: CLLocationCoordinate2D(latitude: 30.1975, longitude: -81.3959)
        ),
        Course(
            rank: 21,
            name: "Streamsong (Black)",
            designer: "Gil Hanse",
            yearBuilt: 2017,
            par: 73,
            state: "FL",
            description: "The newest addition to Streamsong, featuring wide fairways and massive greens with bold contours.",
            location: CLLocationCoordinate2D(latitude: 27.6651, longitude: -81.9308)
        ),
        Course(
            rank: 22,
            name: "Pasatiempo",
            designer: "Alister MacKenzie",
            yearBuilt: 1929,
            par: 70,
            state: "CA",
            description: "Alister MacKenzie masterpiece near Santa Cruz with challenging green complexes and beautiful terrain.",
            location: CLLocationCoordinate2D(latitude: 37.0061, longitude: -122.0146)
        ),
        Course(
            rank: 23,
            name: "French Lick (Pete Dye Course)",
            designer: "Pete Dye",
            yearBuilt: 2009,
            par: 72,
            state: "IN",
            description: "Built on the highest point in Indiana, offering dramatic long-range views and challenging terrain.",
            location: CLLocationCoordinate2D(latitude: 38.5481, longitude: -86.6275)
        ),
        Course(
            rank: 24,
            name: "Kohler (Blackwolf Run - River)",
            designer: "Pete Dye",
            yearBuilt: 1988,
            par: 72,
            state: "WI",
            description: "Winding along the Sheboygan River with tree-lined fairways and strategic water hazards.",
            location: CLLocationCoordinate2D(latitude: 43.7467, longitude: -87.7831)
        ),
        Course(
            rank: 25,
            name: "Harbour Town Golf Links",
            designer: "Pete Dye and Jack Nicklaus",
            yearBuilt: 1969,
            par: 71,
            state: "SC",
            description: "Home of the RBC Heritage, known for its tight fairways, small greens, and iconic lighthouse behind the 18th green.",
            location: CLLocationCoordinate2D(latitude: 32.1398, longitude: -80.8075)
        ),
        Course(
            rank: 26,
            name: "Forest Dunes",
            designer: "Tom Weiskopf",
            yearBuilt: 2002,
            par: 72,
            state: "MI",
            description: "Set in northern Michigan forest, featuring immaculate conditions and dramatic bunkering.",
            location: CLLocationCoordinate2D(latitude: 44.6399, longitude: -84.4882)
        ),
        Course(
            rank: 27,
            name: "Torrey Pines (South)",
            designer: "William F. Bell, redesigned by Rees Jones",
            yearBuilt: 1957,
            par: 72,
            state: "CA",
            description: "Municipal course perched on cliffs above the Pacific Ocean and host of multiple U.S. Opens.",
            location: CLLocationCoordinate2D(latitude: 32.9014, longitude: -117.2531)
        ),
        Course(
            rank: 28,
            name: "Kohler (Whistling Straits - Irish)",
            designer: "Pete Dye",
            yearBuilt: 2000,
            par: 72,
            state: "WI",
            description: "Sister course to the Straits, featuring inland links-style terrain with dunes and grasses.",
            location: CLLocationCoordinate2D(latitude: 43.8508, longitude: -87.7005)
        ),
        Course(
            rank: 29,
            name: "The Loop at Forest Dunes",
            designer: "Tom Doak",
            yearBuilt: 2016,
            par: 70,
            state: "WI",
            description: "Revolutionary reversible course that can be played clockwise or counterclockwise on alternate days.",
            location: CLLocationCoordinate2D(latitude: 44.6399, longitude: -84.4882)
        ),
        Course(
            rank: 30,
            name: "Kohler (Blackwolf Run - Meadow Valleys)",
            designer: "Pete Dye",
            yearBuilt: 1988,
            par: 72,
            state: "WI",
            description: "Featuring meadows, ravines, and strategic water hazards, complementing its sister River course.",
            location: CLLocationCoordinate2D(latitude: 43.7467, longitude: -87.7831)
        ),
        Course(
            rank: 31,
            name: "Erin Hills",
            designer: "Michael Hurdzan, Dana Fry, and Ron Whitten",
            yearBuilt: 2006,
            par: 72,
            state: "WI",
            description: "Host of the 2017 U.S. Open, built on dramatic glacial terrain with minimal earth-moving.",
            location: CLLocationCoordinate2D(latitude: 43.3119, longitude: -88.3738)
        ),
        Course(
            rank: 32,
            name: "Gamble Sands",
            designer: "David McLay Kidd",
            yearBuilt: 2014,
            par: 72,
            state: "WA",
            description: "Featuring wide fairways set in high desert terrain above the Columbia River in Washington.",
            location: CLLocationCoordinate2D(latitude: 48.0007, longitude: -119.3007)
        ),
        Course(
            rank: 33,
            name: "Tobacco Road",
            designer: "Mike Strantz",
            yearBuilt: 1998,
            par: 71,
            state: "NC",
            description: "Built on an old sand quarry with dramatic elevation changes and visual intimidation throughout.",
            location: CLLocationCoordinate2D(latitude: 35.4475, longitude: -79.2475)
        ),
        Course(
            rank: 34,
            name: "May River at Palmetto Bluff",
            designer: "Jack Nicklaus",
            yearBuilt: 2004,
            par: 72,
            state: "SC",
            description: "Set along the May River in South Carolina's Lowcountry, featuring ancient oaks and native landscapes.",
            location: CLLocationCoordinate2D(latitude: 32.1953, longitude: -80.9388)
        ),
        Course(
            rank: 35,
            name: "Bayonne Golf Club",
            designer: "Eric Bergstol",
            yearBuilt: 2006,
            par: 71,
            state: "NJ",
            description: "Irish-links inspired course built on a former landfill with spectacular New York Harbor views.",
            location: CLLocationCoordinate2D(latitude: 40.6614, longitude: -74.0852)
        ),
        Course(
            rank: 36,
            name: "Quintero Golf Club",
            designer: "Rees Jones",
            yearBuilt: 2000,
            par: 72,
            state: "AZ",
            description: "Set in the Sonoran Desert with dramatic elevation changes and mountain views.",
            location: CLLocationCoordinate2D(latitude: 33.8683, longitude: -112.6023)
        ),
        Course(
            rank: 37,
            name: "Mauna Kea",
            designer: "Robert Trent Jones Sr.",
            yearBuilt: 1964,
            par: 72,
            state: "HI",
            description: "Hawaiian masterpiece featuring the famous par-3 3rd hole playing over an ocean cove.",
            location: CLLocationCoordinate2D(latitude: 20.0025, longitude: -155.8220)
        ),
        Course(
            rank: 38,
            name: "Lawsonia (Links)",
            designer: "William Langford and Theodore Moreau",
            yearBuilt: 1930,
            par: 72,
            state: "WI",
            description: "Classic Golden Age course with dramatic greens, some elevated using buried railroad cars.",
            location: CLLocationCoordinate2D(latitude: 43.8381, longitude: -89.0025)
        ),
        Course(
            rank: 39,
            name: "World Woods (Pine Barrens)",
            designer: "Tom Fazio",
            yearBuilt: 1993,
            par: 71,
            state: "FL",
            description: "Tom Fazio design inspired by Pine Valley, featuring sandy waste areas and pine forest.",
            location: CLLocationCoordinate2D(latitude: 28.6106, longitude: -82.5702)
        ),
        Course(
            rank: 40,
            name: "Giants Ridge (Quarry)",
            designer: "Jeff Brauer",
            yearBuilt: 2003,
            par: 72,
            state: "MN",
            description: "Built on an abandoned iron ore mining site in Minnesota's Iron Range, featuring dramatic elevation changes.",
            location: CLLocationCoordinate2D(latitude: 47.5208, longitude: -92.2403)
        ),
        Course(
            rank: 41,
            name: "Rustic Canyon",
            designer: "Gil Hanse, Geoff Shackelford, and Jim Wagner",
            yearBuilt: 2002,
            par: 72,
            state: "CA",
            description: "Minimalist design set in a natural canyon near Los Angeles, featuring firm, fast conditions.",
            location: CLLocationCoordinate2D(latitude: 34.3272, longitude: -118.9861)
        ),
        Course(
            rank: 42,
            name: "Trump Golf Links at Ferry Point",
            designer: "Jack Nicklaus",
            yearBuilt: 2015,
            par: 72,
            state: "NY",
            description: "Links-style municipal course with views of the Manhattan skyline, built on a former landfill.",
            location: CLLocationCoordinate2D(latitude: 40.8053, longitude: -73.8315)
        ),
        Course(
            rank: 43,
            name: "Gold Mountain (Olympic)",
            designer: "John Harbottle III",
            yearBuilt: 1996,
            par: 72,
            state: "WA",
            description: "Municipal course featuring Pacific Northwest forests and strategic design at an affordable price.",
            location: CLLocationCoordinate2D(latitude: 47.5631, longitude: -122.7299)
        ),
        Course(
            rank: 44,
            name: "Crosswater Club",
            designer: "Bob Cupp",
            yearBuilt: 1995,
            par: 72,
            state: "OR",
            description: "Set on a nature preserve with the Deschutes and Little Deschutes Rivers coming into play on seven holes.",
            location: CLLocationCoordinate2D(latitude: 43.9008, longitude: -121.4247)
        ),
        Course(
            rank: 45,
            name: "Pumpkin Ridge (Ghost Creek)",
            designer: "Bob Cupp",
            yearBuilt: 1992,
            par: 71,
            state: "OR",
            description: "Host of multiple USGA championships, set among farmland and forests outside Portland.",
            location: CLLocationCoordinate2D(latitude: 45.6798, longitude: -123.0007)
        ),
        Course(
            rank: 46,
            name: "Greywalls at Marquette Golf Club",
            designer: "Mike DeVries",
            yearBuilt: 2005,
            par: 71,
            state: "MI",
            description: "Dramatic course built along exposed granite rock outcroppings in Michigan's Upper Peninsula.",
            location: CLLocationCoordinate2D(latitude: 46.5692, longitude: -87.4096)
        ),
        Course(
            rank: 47,
            name: "Arcadia South",
            designer: "Dana Fry and Jason Straka",
            yearBuilt: 2018,
            par: 72,
            state: "MI",
            description: "Classic parkland-style companion to the Bluffs course, featuring strategic bunkering and gentle terrain.",
            location: CLLocationCoordinate2D(latitude: 44.4126, longitude: -86.2333)
        ),
        Course(
            rank: 48,
            name: "Sandpiper Golf Club",
            designer: "William F. Bell",
            yearBuilt: 1972,
            par: 72,
            state: "CA",
            description: "Coastal gem near Santa Barbara featuring oceanside holes and stunning Pacific views.",
            location: CLLocationCoordinate2D(latitude: 34.4246, longitude: -119.9073)
        ),
        Course(
            rank: 49,
            name: "Silvies Valley Ranch (Hankins)",
            designer: "Dan Hixson",
            yearBuilt: 2017,
            par: 72,
            state: "OR",
            description: "Reversible course similar to The Loop, sharing fairways with its Craddock companion course.",
            location: CLLocationCoordinate2D(latitude: 44.0140, longitude: -118.9437)
        ),
        Course(
            rank: 50,
            name: "Plantation Course at Kapalua",
            designer: "Bill Coore and Ben Crenshaw",
            yearBuilt: 1991,
            par: 73,
            state: "HI",
            description: "Home of the PGA Tour's Tournament of Champions, featuring dramatic elevation changes and ocean views.",
            location: CLLocationCoordinate2D(latitude: 20.9995, longitude: -156.6408)
        ),
        Course(
            rank: 51,
            name: "Dunes Club",
            designer: "Dick Nugent",
            yearBuilt: 1991,
            par: 35,
            state: "MI",
            description: "Exclusive 9-hole gem set among sand dunes along Lake Michigan, consistently ranked among the best 9-hole courses.",
            location: CLLocationCoordinate2D(latitude: 45.3314, longitude: -86.2233)
        ),
        Course(
            rank: 52,
            name: "The Harvester",
            designer: "Keith Foster",
            yearBuilt: 2000,
            par: 72,
            state: "IA",
            description: "Hidden gem in Iowa featuring dramatic topography, strategic bunkering, and pristine conditions.",
            location: CLLocationCoordinate2D(latitude: 41.8558, longitude: -93.3080)
        ),
        Course(
            rank: 53,
            name: "Wine Valley",
            designer: "Dan Hixson",
            yearBuilt: 2009,
            par: 72,
            state: "WA",
            description: "Minimalist design in the Walla Walla wine country with mountain views and rolling terrain.",
            location: CLLocationCoordinate2D(latitude: 46.0419, longitude: -118.3733)
        ),
        Course(
            rank: 54,
            name: "True North",
            designer: "Jim Engh",
            yearBuilt: 2004,
            par: 72,
            state: "MI",
            description: "Carved through northern Michigan hardwoods with dramatic elevation changes and natural hazards.",
            location: CLLocationCoordinate2D(latitude: 45.2356, longitude: -85.1353)
        ),
        Course(
            rank: 55,
            name: "Bay Harbor (Links/Quarry)",
            designer: "Arthur Hills",
            yearBuilt: 1998,
            par: 72,
            state: "MI",
            description: "Spectacular combination of shoreline holes and dramatic quarry settings along Lake Michigan.",
            location: CLLocationCoordinate2D(latitude: 45.3828, longitude: -85.0175)
        ),
        Course(
            rank: 56,
            name: "Tetherow",
            designer: "David McLay Kidd",
            yearBuilt: 2008,
            par: 72,
            state: "OR",
            description: "Scottish heathland-inspired design in Bend, Oregon featuring fescue fairways and dramatic bunkering.",
            location: CLLocationCoordinate2D(latitude: 44.0164, longitude: -121.3866)
        ),
        Course(
            rank: 57,
            name: "Taconic Golf Club",
            designer: "Wayne Stiles and John Van Kleek",
            yearBuilt: 1927,
            par: 71,
            state: "MA",
            description: "Historic course owned by Williams College, featuring classic New England terrain and mountain views.",
            location: CLLocationCoordinate2D(latitude: 42.7115, longitude: -73.2084)
        ),
        Course(
            rank: 58,
            name: "Sandhill",
            designer: "Mike Strantz",
            yearBuilt: 1995,
            par: 71,
            state: "NC",
            description: "Minimalist masterpiece in the Sandhills of North Carolina, featuring natural terrain and strategic design.",
            location: CLLocationCoordinate2D(latitude: 35.1746, longitude: -79.4646)
        ),
        Course(
            rank: 59,
            name: "Circling Raven",
            designer: "Gene Bates",
            yearBuilt: 2003,
            par: 72,
            state: "ID",
            description: "Tribal-owned course set on 620 acres of wetlands, woodlands, and Palouse grasslands in northern Idaho.",
            location: CLLocationCoordinate2D(latitude: 47.3903, longitude: -117.0348)
        ),
        Course(
            rank: 60,
            name: "University of Michigan Golf Course",
            designer: "Alister MacKenzie",
            yearBuilt: 1931,
            par: 71,
            state: "MI",
            description: "MacKenzie gem in the heart of Ann Arbor, featuring dramatic elevation changes and strategic design.",
            location: CLLocationCoordinate2D(latitude: 42.2658, longitude: -83.7500)
        ),
        Course(
            rank: 61,
            name: "Bayside Resort Golf Club",
            designer: "Jack Nicklaus",
            yearBuilt: 2005,
            par: 72,
            state: "DE",
            description: "Jack Nicklaus Signature design featuring bayside holes and marshland settings in coastal Delaware.",
            location: CLLocationCoordinate2D(latitude: 38.4550, longitude: -75.0563)
        ),
        Course(
            rank: 62,
            name: "Fallen Oak",
            designer: "Tom Fazio",
            yearBuilt: 2006,
            par: 72,
            state: "MS",
            description: "Exclusive amenity for Beau Rivage Resort guests, featuring dramatic elevation changes uncommon for the Gulf Coast.",
            location: CLLocationCoordinate2D(latitude: 30.5283, longitude: -88.9217)
        ),
        Course(
            rank: 63,
            name: "Kapalua (Bay Course)",
            designer: "Arnold Palmer and Francis Duane",
            yearBuilt: 1975,
            par: 72,
            state: "HI",
            description: "Seaside Hawaiian course featuring the only hole to play over the ocean on Maui.",
            location: CLLocationCoordinate2D(latitude: 20.9962, longitude: -156.6664)
        ),
        Course(
            rank: 64,
            name: "Bethpage (Red)",
            designer: "A.W. Tillinghast",
            yearBuilt: 1935,
            par: 71,
            state: "NY",
            description: "Sister course to the Black, offering a more playable but still challenging A.W. Tillinghast design.",
            location: CLLocationCoordinate2D(latitude: 40.7392, longitude: -73.4653)
        ),
        Course(
            rank: 65,
            name: "Hawktree Golf Club",
            designer: "Jim Engh",
            yearBuilt: 2000,
            par: 72,
            state: "ND",
            description: "Prairie links-style course featuring distinctive black sand bunkers near Bismarck, North Dakota.",
            location: CLLocationCoordinate2D(latitude: 46.9056, longitude: -100.8833)
        ),
        Course(
            rank: 66,
            name: "Kaluhyat at Turning Stone",
            designer: "Robert Trent Jones Jr.",
            yearBuilt: 2003,
            par: 72,
            state: "NY",
            description: "Challenging layout set among wetlands and woodlands at the Oneida Indian Nation's resort.",
            location: CLLocationCoordinate2D(latitude: 43.1208, longitude: -75.6050)
        ),
        Course(
            rank: 67,
            name: "The Golf Courses of Lawsonia (Woodlands)",
            designer: "Rocky Roquemore",
            yearBuilt: 1983,
            par: 72,
            state: "WI",
            description: "Tree-lined complement to the Links course, offering a completely different experience through mature forests.",
            location: CLLocationCoordinate2D(latitude: 43.8381, longitude: -89.0025)
        ),
        Course(
            rank: 68,
            name: "Wailea (Gold)",
            designer: "Robert Trent Jones Jr.",
            yearBuilt: 1994,
            par: 72,
            state: "HI",
            description: "Maui masterpiece featuring lava rock walls, coral sand bunkers, and stunning ocean and mountain views.",
            location: CLLocationCoordinate2D(latitude: 20.6842, longitude: -156.4368)
        ),
        Course(
            rank: 69,
            name: "Suncadia (Prospector)",
            designer: "Arnold Palmer",
            yearBuilt: 2005,
            par: 72,
            state: "WA",
            description: "Mountain course in the Cascade Mountains featuring spectacular views and dramatic elevation changes.",
            location: CLLocationCoordinate2D(latitude: 47.1792, longitude: -121.0003)
        ),
        Course(
            rank: 70,
            name: "Railwood Golf Club",
            designer: "Michael Benkusky",
            yearBuilt: 1992,
            par: 72,
            state: "MO",
            description: "Rural Missouri hidden gem featuring dramatic elevation changes and pristine conditions.",
            location: CLLocationCoordinate2D(latitude: 38.6972, longitude: -92.0628)
        ),
        Course(
            rank: 71,
            name: "Ak-Chin Southern Dunes",
            designer: "Brian Curley and Fred Couples",
            yearBuilt: 2002,
            par: 72,
            state: "AZ",
            description: "Desert links-style course with more than 100 bunkers and challenging design south of Phoenix.",
            location: CLLocationCoordinate2D(latitude: 32.9736, longitude: -112.0297)
        ),
        Course(
            rank: 72,
            name: "The Virtues Golf Club",
            designer: "Arthur Hills",
            yearBuilt: 1999,
            par: 72,
            state: "OH",
            description: "Formerly Longaberger Golf Club, featuring dramatic elevation changes and challenging shot values in Ohio.",
            location: CLLocationCoordinate2D(latitude: 40.0639, longitude: -82.2953)
        ),
        Course(
            rank: 73,
            name: "Manele Golf Course",
            designer: "Jack Nicklaus",
            yearBuilt: 1993,
            par: 72,
            state: "HI",
            description: "Dramatic oceanside Jack Nicklaus design on the island of Lanai with three holes on cliffs above the Pacific.",
            location: CLLocationCoordinate2D(latitude: 20.7386, longitude: -156.9219)
        ),
        Course(
            rank: 74,
            name: "South Course at Corica Park",
            designer: "Rees Jones, redesigned by Marc Logan",
            yearBuilt: 1927,
            par: 72,
            state: "CA",
            description: "Municipal course in Alameda, California redesigned with Australian Sandbelt inspiration.",
            location: CLLocationCoordinate2D(latitude: 37.7288, longitude: -122.1306)
        ),
        Course(
            rank: 75,
            name: "Wilderness Club",
            designer: "Nick Faldo",
            yearBuilt: 2009,
            par: 72,
            state: "MT",
            description: "Secluded Montana masterpiece with stunning Rocky Mountain views near Glacier National Park.",
            location: CLLocationCoordinate2D(latitude: 48.9087, longitude: -114.7738)
        ),
        Course(
            rank: 76,
            name: "Butterfield Trail",
            designer: "Tom Fazio",
            yearBuilt: 2007,
            par: 72,
            state: "TX",
            description: "Desert course in El Paso featuring dramatic elevation changes and mountain views.",
            location: CLLocationCoordinate2D(latitude: 31.7841, longitude: -106.3922)
        ),
        Course(
            rank: 77,
            name: "Longaberger Golf Club",
            designer: "Arthur Hills",
            yearBuilt: 1999,
            par: 72,
            state: "OH",
            description: "Ohio gem featuring dramatic elevation changes and spectacular views of the surrounding countryside.",
            location: CLLocationCoordinate2D(latitude: 40.0639, longitude: -82.2953)
        ),
        Course(
            rank: 78,
            name: "Atunyote at Turning Stone",
            designer: "Tom Fazio",
            yearBuilt: 2004,
            par: 72,
            state: "NY",
            description: "Former host of a PGA Tour event, featuring pristine conditions and strategic water hazards.",
            location: CLLocationCoordinate2D(latitude: 43.1208, longitude: -75.6050)
        ),
        Course(
            rank: 79,
            name: "Giant's Ridge (Legend)",
            designer: "Jeff Brauer",
            yearBuilt: 1997,
            par: 72,
            state: "MN",
            description: "Northern Minnesota course set among the Northwoods with dramatic elevation changes.",
            location: CLLocationCoordinate2D(latitude: 47.5208, longitude: -92.2403)
        ),
        Course(
            rank: 80,
            name: "Half Moon Bay (Ocean Course)",
            designer: "Arthur Hills",
            yearBuilt: 1997,
            par: 72,
            state: "CA",
            description: "Links-style course finishing with a dramatic par-4 along coastal cliffs overlooking the Pacific.",
            location: CLLocationCoordinate2D(latitude: 37.4316, longitude: -122.4419)
        ),
        Course(
            rank: 81,
            name: "Omni La Costa (Champions)",
            designer: "Dick Wilson, redesigned by Damian Pascuzzo and Jeff Brauer",
            yearBuilt: 1965,
            par: 72,
            state: "CA",
            description: "Historic Southern California course that hosted numerous professional tournaments.",
            location: CLLocationCoordinate2D(latitude: 33.0964, longitude: -117.2916)
        ),
        Course(
            rank: 82,
            name: "Boyne Highlands (Heather)",
            designer: "Robert Trent Jones Sr.",
            yearBuilt: 1966,
            par: 72,
            state: "MI",
            description: "Classic Robert Trent Jones Sr. design in northern Michigan featuring strategic bunkering.",
            location: CLLocationCoordinate2D(latitude: 45.4670, longitude: -84.9297)
        ),
        Course(
            rank: 83,
            name: "Blackwolf Run (Original Championship)",
            designer: "Pete Dye",
            yearBuilt: 1988,
            par: 72,
            state: "WI",
            description: "Combination of holes from the River and Meadow Valleys courses used for major championships.",
            location: CLLocationCoordinate2D(latitude: 43.7467, longitude: -87.7831)
        ),
        Course(
            rank: 84,
            name: "Primm Valley (Lakes)",
            designer: "Tom Fazio",
            yearBuilt: 1997,
            par: 71,
            state: "NV",
            description: "Desert oasis featuring numerous water hazards just across the California-Nevada border.",
            location: CLLocationCoordinate2D(latitude: 35.6092, longitude: -115.3880)
        ),
        Course(
            rank: 85,
            name: "Osprey Point at Kiawah Island",
            designer: "Tom Fazio",
            yearBuilt: 1988,
            par: 72,
            state: "SC",
            description: "Scenic Lowcountry course winding through maritime forests, marshes, and lagoons.",
            location: CLLocationCoordinate2D(latitude: 32.6070, longitude: -80.0525)
        ),
        Course(
            rank: 86,
            name: "The Classic at Madden's",
            designer: "Geoffrey Cornish",
            yearBuilt: 1997,
            par: 72,
            state: "MN",
            description: "Minnesota resort course featuring bentgrass fairways and strategic design.",
            location: CLLocationCoordinate2D(latitude: 46.4708, longitude: -94.3163)
        ),
        Course(
            rank: 87,
            name: "PGA WEST (TPC Stadium)",
            designer: "Pete Dye",
            yearBuilt: 1986,
            par: 72,
            state: "CA",
            description: "Infamous Pete Dye design once considered so difficult it sparked professional player protests.",
            location: CLLocationCoordinate2D(latitude: 33.7076, longitude: -116.2722)
        ),
        Course(
            rank: 88,
            name: "Acoaxet Club",
            designer: "Donald Ross",
            yearBuilt: 1922,
            par: 35,
            state: "RI",
            description: "Historic 9-hole New England gem with classic Donald Ross features and coastal views.",
            location: CLLocationCoordinate2D(latitude: 41.5097, longitude: -71.0755)
        ),
        Course(
            rank: 89,
            name: "Bulle Rock",
            designer: "Pete Dye",
            yearBuilt: 1998,
            par: 72,
            state: "MD",
            description: "Former host of the LPGA Championship in Maryland, known for excellent conditioning.",
            location: CLLocationCoordinate2D(latitude: 39.5651, longitude: -76.0889)
        ),
        Course(
            rank: 90,
            name: "Shenandoah at Turning Stone",
            designer: "Rick Smith",
            yearBuilt: 2000,
            par: 72,
            state: "NY",
            description: "Heathland-style course featuring native grasses and strategic bunkering.",
            location: CLLocationCoordinate2D(latitude: 43.1208, longitude: -75.6050)
        ),
        Course(
            rank: 91,
            name: "TPC San Antonio (AT&T Oaks)",
            designer: "Greg Norman with Sergio Garcia",
            yearBuilt: 2010,
            par: 72,
            state: "TX",
            description: "Host of the Valero Texas Open, featuring challenging design through rolling Hill Country terrain.",
            location: CLLocationCoordinate2D(latitude: 29.6015, longitude: -98.4045)
        ),
        Course(
            rank: 92,
            name: "Torrey Pines (North)",
            designer: "William F. Bell, redesigned by Tom Weiskopf",
            yearBuilt: 1957,
            par: 72,
            state: "CA",
            description: "Recently renovated municipal course with Pacific Ocean views, sister to the South course.",
            location: CLLocationCoordinate2D(latitude: 32.9007, longitude: -117.2424)
        ),
        Course(
            rank: 93,
            name: "Indian Wells (Players)",
            designer: "John Fought",
            yearBuilt: 2007,
            par: 72,
            state: "CA",
            description: "Desert course featuring spectacular mountain views and strategic bunkering.",
            location: CLLocationCoordinate2D(latitude: 33.7243, longitude: -116.3087)
        ),
        Course(
            rank: 94,
            name: "Birck Boilermaker (Kampen)",
            designer: "Pete Dye",
            yearBuilt: 1998,
            par: 72,
            state: "IN",
            description: "Challenging Pete Dye design on the campus of Purdue University featuring strategic wetlands.",
            location: CLLocationCoordinate2D(latitude: 40.4249, longitude: -86.9176)
        ),
        Course(
            rank: 95,
            name: "The Prairie Club (Dunes)",
            designer: "Tom Lehman and Chris Brands",
            yearBuilt: 2010,
            par: 73,
            state: "NE",
            description: "Minimalist masterpiece set in the remote Sand Hills of Nebraska with massive fairways.",
            location: CLLocationCoordinate2D(latitude: 42.7691, longitude: -100.5687)
        ),
        Course(
            rank: 96,
            name: "Old American Golf Club",
            designer: "Tripp Davis and Justin Leonard",
            yearBuilt: 2010,
            par: 71,
            state: "TX",
            description: "Golden Age-inspired design along Lake Lewisville north of Dallas.",
            location: CLLocationCoordinate2D(latitude: 33.1290, longitude: -96.9508)
        ),
        Course(
            rank: 97,
            name: "TPC Las Vegas",
            designer: "Bobby Weed and Raymond Floyd",
            yearBuilt: 1996,
            par: 71,
            state: "NV",
            description: "Desert course featuring canyons and arroyos just minutes from the Las Vegas Strip.",
            location: CLLocationCoordinate2D(latitude: 36.1930, longitude: -115.3286)
        ),
        Course(
            rank: 98,
            name: "Turtle Bay (Arnold Palmer Course)",
            designer: "Arnold Palmer and Ed Seay",
            yearBuilt: 1992,
            par: 72,
            state: "HI",
            description: "Former host of Champions Tour events on Oahu's North Shore featuring coastal holes.",
            location: CLLocationCoordinate2D(latitude: 21.7049, longitude: -157.9941)
        ),
        Course(
            rank: 99,
            name: "Seneca Hickory Stick",
            designer: "Robert Trent Jones Jr.",
            yearBuilt: 2010,
            par: 72,
            state: "NY",
            description: "Tribal-owned course in western New York featuring strategic design and pristine conditions.",
            location: CLLocationCoordinate2D(latitude: 43.1539, longitude: -78.9808)
        ),
        Course(
            rank: 100,
            name: "Dubsdread at Cog Hill",
            designer: "Joe Lee, redesigned by Rees Jones",
            yearBuilt: 1964,
            par: 72,
            state: "IL",
            description: "Former host of the BMW Championship outside Chicago, known for its challenging design and conditioning.",
            location: CLLocationCoordinate2D(latitude: 41.6797, longitude: -87.9389)
        )
    ]
}
